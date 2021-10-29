import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:aplikacja_sklep/core/error/failures.dart';

part 'any_list_event.dart';

part 'any_list_state.dart';

part 'ext_bloc.dart';

abstract class AnyListBloc<Data, Search> extends ExtBloc<AnyListEvent, AnyListState> {
  AnyListBloc({final AnyListState? initialState}) : super(initialState ?? const StartState()) {
    numberOfLoadedPages = firstPageNum;
  }

  List<Data> loadedItems = [];
  Search? search;
  List appendedItems = [];
  int firstPageNum = 1;
  late int numberOfLoadedPages;
  bool hasMoreItems = true;
  Object? error;
  bool isFetching = false;
  int pageSize = 20;
  bool isRetrying = false;
  Timer? _debounce;

  bool get noItemsFound => this.loadedItems.isEmpty && this.hasMoreItems == false;
  final Duration searchDebounceTime = const Duration(milliseconds: 500);

  Future<Either<Failure, List<Data>>> fetchForPage(final int page, final Search? search);

  @override
  Stream<AnyListState> mapEventToState(final AnyListEvent event) async* {
    if (event is AnyListRefreshEvent) {
      final emptyList = loadedItems.isNotEmpty;
      reset();
      yield AnyListLoading(hasData: emptyList);
      yield* _mapShopsFetchNextPageState(false);
    } else if (event is AnyListFetchNewPageEvent) {
      yield* _mapShopsFetchNextPageState(false);
    } else if (event is AnyListRetryEvent) {
      yield* _mapShopsFetchNextPageState(true);
    } else if (event is AnyListSearchEvent) {
      mapAnyListSearchEvent(event);
    } else if (event is CleanAnyListEvent) {
      reset();
      yield const AnyListEmpty();
    }
  }

  Stream<AnyListState> _mapShopsFetchNextPageState(final bool isRetry) async* {
    if (!this.isFetching && this.hasMoreItems) {
      this.isFetching = true;
      isRetrying = isRetry;
      if (isRetrying) {
        error = null;
        hasMoreItems = true;
        yield AnyListDataFetched(
          data: this.loadedItems,
          hasSingleData: false,
          singleData: null,
          hasData: loadedItems.isNotEmpty,
          search: search,
          isRetry: isRetry,
        );
        isRetrying = !isRetry;
      }
      List<Data>? page;
      final result = await fetchForPage(numberOfLoadedPages, search);
      yield* result.fold((final error) async* {
        this.error = error;
        this.isFetching = false;
        yield AnyListError(
          error: error,
          hasData: loadedItems.isNotEmpty,
        );
      }, (final data) async* {
        page = data;
        Fimber.d("ANY LIST LOGIC: page size = ${page!.length}");
        this.numberOfLoadedPages++;
      });

      // Get length accounting for possible null Future return. We'l treat a null Future as an empty return
      final int length = (page?.length ?? 0);

      if (length > this.pageSize) {
        this.isFetching = false;
        throw Exception('Page length ($length) is greater than the maximum size (${this.pageSize})');
      }

      if (length > 0 && length < this.pageSize) {
        // This should only happen when loading the last page.
        // In that case, we append the last page with a few items to make its size
        // similar to normal pages. This is useful especially with GridView,
        // because we want the loading to show on a new line on its own
        this.appendedItems = List.generate(this.pageSize - length, (final _) => {});
      }

      if (length == 0) {
        this.hasMoreItems = false;
      } else {
        if (length < pageSize) {
          this.hasMoreItems = false;
        }
        this.loadedItems.addAll(page!);
        Fimber.d("ANY LIST LOGIC: loaded data size - ${this.loadedItems.length}");
      }
      this.isFetching = false;
      if (this.loadedItems.isNotEmpty) {
        yield AnyListDataFetched(
          data: List.from(this.loadedItems, growable: false),
          hasSingleData: false,
          singleData: null,
          hasData: loadedItems.isNotEmpty,
          search: search,
        );
      } else {
        if (error == null) {
          yield const AnyListEmpty();
        }
      }
    }
  }

  @mustCallSuper
  void mapAnyListSearchEvent(final AnyListSearchEvent event) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(searchDebounceTime, () {
      this.search = event.search;
      add(const AnyListRefreshEvent());
    });
  }

  @mustCallSuper
  @override
  Future close() {
    _debounce?.cancel();
    return super.close();
  }

  void reset() {
    this.appendedItems = [];
    this.loadedItems = [];
    this.numberOfLoadedPages = firstPageNum;
    this.hasMoreItems = true;
    this.error = null;
    this.isFetching = false;
  }
}
