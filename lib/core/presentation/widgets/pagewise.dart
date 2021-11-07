import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/helpers/grid_helpers.dart';
import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/presentation/blocs/any_fetch_bloc/any_fetch_bloc.dart';
import 'package:aplikacja_sklep/core/presentation/blocs/any_list/any_list_bloc.dart';

typedef ItemBuilder = Widget Function(BuildContext context, PagewiseListState entry);
typedef RetryCallback = void Function();
typedef PagewiseBuilder = Widget Function(PagewiseState state);

abstract class PagewiseListState extends Equatable {
  const PagewiseListState();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'PagewiseListState';
}

class EmptyPagewiseState extends PagewiseListState {
  const EmptyPagewiseState();
}

class RetryPagewiseState extends ErrorPagewiseState {
  const RetryPagewiseState(final Failure failure) : super(failure);
}

class RefreshPagewiseState extends PagewiseListState {
  const RefreshPagewiseState();
}

class LoadMorePagewiseState extends PagewiseListState {
  const LoadMorePagewiseState();
}

class ErrorPagewiseState extends PagewiseListState {
  const ErrorPagewiseState(this.failure);

  final Failure failure;
}

class DataPagewiseState<T> extends PagewiseListState {
  const DataPagewiseState(this.element);

  final T element;
}

class SingleDataPagewiseState<T> extends DataPagewiseState<T> {
  const SingleDataPagewiseState(final T element) : super(element);
}

/// An abstract base class for widgets that fetch their content one page at a
/// time.
///
/// The widget fetches the page when we scroll down to it, and then keeps it in
/// memory
///
/// You can build your own Pagewise widgets by extending this class and
/// returning your builder in the [builder] function which provides you with the
/// Pagewise state. Look [PagewiseBlocListView] and [PagewiseGridView] for examples.
///
/// See also:
///
///  * [PagewiseGridView], a [Pagewise] implementation of [GridView](https://docs.flutter.io/flutter/widgets/GridView-class.html)
///  * [PagewiseBlocListView], a [Pagewise] implementation of [ListView](https://docs.flutter.io/flutter/widgets/ListView-class.html)
abstract class Pagewise<T, V, E extends AnyListBloc<T, V>> extends StatefulWidget {
  /// Creates a pagewise widget.
  ///
  /// This is an abstract class, this constructor should only be called from
  /// constructors of widgets that extend this class
  const Pagewise({
    required final this.itemBuilder,
    required final this.builder,
    final this.pageSize = 20,
    final this.pageLoadController,
    final this.showRetry = true,
    final Key? key,
  }) : super(key: key);

  /// The number  of entries per page
  final int pageSize;

  /// Whether to show a retry button when page fails to load.
  ///
  /// If set to true, [retryBuilder] is called to show appropriate retry button.
  ///
  /// If set to false, [errorBuilder] is called instead to show appropriate
  /// error.
  final bool showRetry;

  /// Called to build each entry in the view.
  ///
  /// It is called for each of the entries fetched by [pageFuture] and provided
  /// with the [BuildContext](https://docs.flutter.io/flutter/widgets/BuildContext-class.html) and the entry. It is expected to return the widget
  /// that we want to display for each entry
  ///
  /// For example, the [pageFuture] might return a list that looks like:
  /// ```dart
  ///[
  ///  {
  ///    'name': 'product1',
  ///    'price': 10
  ///  },
  ///  {
  ///    'name': 'product2',
  ///    'price': 15
  ///  },
  ///]
  /// ```
  /// Then itemBuilder will be called twice, once for each entry. We can for
  /// example do:
  /// ```dart
  /// (BuildContext context, dynamic entry) {
  ///   return Text(entry['name'] + ' - ' + entry['price']);
  /// }
  /// ```
  final ItemBuilder itemBuilder;

  /// The actual builder that builds the Pagewise widget. It is called and
  /// provided the PagewiseState. This function is important only for classes
  /// extending Pagewise. See [PagewiseBlocListView] and [PagewiseGridView] for
  /// examples.
  final PagewiseBuilder builder;

  /// The controller that controls the loading of pages.
  ///
  /// You don't have to provide this parameter unless you want to control or
  /// listen to the data that Pagewise fetches. Review the documentation of
  /// [PagewiseLoadController] for more details
  final E? pageLoadController;

  @override
  PagewiseState<T, V, E> createState() => PagewiseState<T, V, E>();
}

class PagewiseState<T, V, E extends AnyListBloc<T, V>> extends State<Pagewise<T, V, E>> {
  late E _controller;

  AnyListBloc<T, V> get _effectiveController => widget.pageLoadController ?? this._controller;

  late VoidCallback _controllerListener;
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();

    this._controllerListener = () {
      setState(() {});
    };

    subscription = this._effectiveController.stream.listen((final state) => _controllerListener());
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  int get _itemCount => this._effectiveController.loadedItems.length + 1;

  @override
  Widget build(final BuildContext context) {
    final state = this._effectiveController.state;
    if (state is AnyListLoading) {
      return widget.itemBuilder(context, const RefreshPagewiseState());
    } else if (state is AnyListError) {
      return widget.itemBuilder(context, ErrorPagewiseState(state.error));
    } else if (state is AnyListEmpty) {
      return widget.itemBuilder(context, const EmptyPagewiseState());
    } else {
      return widget.builder(this);
    }
  }

  Widget _itemBuilder(final BuildContext context, final int index) {
    final total = this._effectiveController.loadedItems.length + this._effectiveController.appendedItems.length + 1;

    if (index == total - 1) {
      final state = _effectiveController.state;
      if (state is ErrorAnyFetchState) {
        if (widget.showRetry) {
          return widget.itemBuilder(context, RetryPagewiseState((state as ErrorAnyFetchState).error));
        } else {
          return widget.itemBuilder(context, ErrorPagewiseState((state as ErrorAnyFetchState).error));
        }
      }

      if (this._effectiveController.noItemsFound) {
        return widget.itemBuilder(context, const EmptyPagewiseState());
      }

      if (this._effectiveController.hasMoreItems) {
        if (!this._effectiveController.isRetrying) {
          this._effectiveController.add(const AnyListFetchNewPageEvent());
        }
        return widget.itemBuilder(context, const LoadMorePagewiseState());
      } else {
        return Container();
      }
    } else {
      if (index >= this._effectiveController.loadedItems.length) {
        // this means that the function is asking for an element from the
        // appended items, so we return an empty container
        return Container();
      }
      // Otherwise, we return the actual item
      return widget.itemBuilder(context, DataPagewiseState<T>(this._effectiveController.loadedItems[index]));
    }
  }
}

class PagewiseBlocListView<T, V, E extends AnyListBloc<T, V>> extends Pagewise<T, V, E> {
  /// Creates a Pagewise ListView.
  ///
  /// All the properties are either those documented for normal [ListViews](https://docs.flutter.io/flutter/widgets/ListView-class.html),
  /// or those inherited from [Pagewise]
  PagewiseBlocListView({
    required final ItemBuilder itemBuilder,
    final Key? key,
    final EdgeInsetsGeometry? padding,
    final bool? primary,
    final bool addSemanticIndexes = true,
    final bool shrinkWrap = false,
    final ScrollController? controller,
    final bool addAutomaticKeepAlives = true,
    final Axis scrollDirection = Axis.vertical,
    final bool addRepaintBoundaries = true,
    final double? cacheExtent,
    final ScrollPhysics? physics,
    final bool reverse = false,
    final int pageSize = 20,
    final E? bloc,
    final bool showRetry = true,
    final IndexedWidgetBuilder? separatorBuilder,
  }) : super(
      pageSize: pageSize,
      key: key,
      pageLoadController: bloc,
      showRetry: showRetry,
      itemBuilder: itemBuilder,
      builder: (final PagewiseState state) {
        return ListView.separated(
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          scrollDirection: scrollDirection,
          addRepaintBoundaries: addRepaintBoundaries,
          cacheExtent: cacheExtent,
          physics: physics,
          reverse: reverse,
          padding: padding,
          addSemanticIndexes: addSemanticIndexes,
          shrinkWrap: shrinkWrap,
          primary: primary,
          controller: controller,
          itemCount: state._itemCount,
          itemBuilder: state._itemBuilder,
          separatorBuilder: separatorBuilder ?? (final BuildContext context, final int i) => const SizedBox(),
        );
      });
}

class PagewiseGridBlocView<T, V, E extends AnyListBloc<T, V>> extends Pagewise<T, V, E> {
  /// Creates a Pagewise GridView with a crossAxisCount.
  ///
  /// All the properties are either those documented for normal [GridViews](https://docs.flutter.io/flutter/widgets/GridView-class.html)
  /// or those inherited from [Pagewise]
  PagewiseGridBlocView.count({
    required final int crossAxisCount,
    required final ItemBuilder itemBuilder,
    final Key? key,
    final EdgeInsetsGeometry? padding,
    final double childAspectRatio = 1.0,
    final double crossAxisSpacing = 0.0,
    final double mainAxisSpacing = 0.0,
    final bool addSemanticIndexes = true,
    final int? semanticChildCount,
    final bool? primary,
    final bool shrinkWrap = false,
    final ScrollController? controller,
    final bool addAutomaticKeepAlives = true,
    final Axis scrollDirection = Axis.vertical,
    final bool addRepaintBoundaries = true,
    final double? cacheExtent,
    final ScrollPhysics? physics,
    final bool reverse = false,
    final int pageSize = 20,
    final E? bloc,
    final bool showRetry = true,
  }) : super(
      pageSize: pageSize,
      key: key,
      pageLoadController: bloc,
      showRetry: showRetry,
      itemBuilder: itemBuilder,
      builder: (final PagewiseState state) {
        return GridView.builder(
            reverse: reverse,
            physics: physics,
            cacheExtent: cacheExtent,
            addRepaintBoundaries: addRepaintBoundaries,
            scrollDirection: scrollDirection,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            controller: controller,
            primary: primary,
            shrinkWrap: shrinkWrap,
            padding: padding,
            addSemanticIndexes: addSemanticIndexes,
            semanticChildCount: semanticChildCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndLoading(
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
                itemCount: state._itemCount),
            itemCount: state._itemCount,
            itemBuilder: state._itemBuilder);
      });

  /// Creates a Pagewise GridView with a maxCrossAxisExtent.
  ///
  /// All the properties are either those documented for normal [GridViews](https://docs.flutter.io/flutter/widgets/GridView-class.html)
  /// or those inherited from [Pagewise]
  PagewiseGridBlocView.extent({
    required final ItemBuilder itemBuilder,
    required final double maxCrossAxisExtent,
    final Key? key,
    final EdgeInsetsGeometry? padding,
    final double childAspectRatio = 1.0,
    final double crossAxisSpacing = 0.0,
    final double mainAxisSpacing = 0.0,
    final bool addSemanticIndexes = true,
    final int? semanticChildCount,
    final bool? primary,
    final bool shrinkWrap = false,
    final ScrollController? controller,
    final bool addAutomaticKeepAlives = true,
    final Axis scrollDirection = Axis.vertical,
    final bool addRepaintBoundaries = true,
    final double? cacheExtent,
    final ScrollPhysics? physics,
    final bool reverse = false,
    final int pageSize = 20,
    final E? bloc,
    final bool showRetry = true,
  }) : super(
      pageSize: pageSize,
      key: key,
      pageLoadController: bloc,
      showRetry: showRetry,
      itemBuilder: itemBuilder,
      builder: (final PagewiseState state) {
        return GridView.builder(
            reverse: reverse,
            physics: physics,
            cacheExtent: cacheExtent,
            addRepaintBoundaries: addRepaintBoundaries,
            scrollDirection: scrollDirection,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addSemanticIndexes: addSemanticIndexes,
            semanticChildCount: semanticChildCount,
            controller: controller,
            primary: primary,
            shrinkWrap: shrinkWrap,
            padding: padding,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtentAndLoading(
                maxCrossAxisExtent: maxCrossAxisExtent,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
                itemCount: state._itemCount),
            itemCount: state._itemCount,
            itemBuilder: state._itemBuilder);
      });
}

int _kDefaultSemanticIndexCallback(final Widget _, final int localIndex) => localIndex;

class PagewiseSliverList<T, V, E extends AnyListBloc<T, V>> extends Pagewise<T, V, E> {
  /// Creates a Pagewise SliverList.
  ///
  /// All the properties are either those documented for normal [SliverList](https://docs.flutter.io/flutter/widgets/SliverList-class.html)
  /// or those inherited from [Pagewise]
  PagewiseSliverList({
    required final ItemBuilder itemBuilder,
    final Key? key,
    final bool addSemanticIndexes = true,
    final bool addAutomaticKeepAlives = true,
    final bool addRepaintBoundaries = true,
    final SemanticIndexCallback semanticIndexCallback = _kDefaultSemanticIndexCallback,
    final int semanticIndexOffset = 0,
    final int pageSize = 20,
    final E? bloc,
    final bool showRetry = true,
  }) : super(
      pageSize: pageSize,
      key: key,
      showRetry: showRetry,
      itemBuilder: itemBuilder,
      pageLoadController: bloc,
      builder: (final PagewiseState state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(state._itemBuilder,
              addAutomaticKeepAlives: addAutomaticKeepAlives,
              addRepaintBoundaries: addRepaintBoundaries,
              addSemanticIndexes: addSemanticIndexes,
              semanticIndexCallback: semanticIndexCallback,
              semanticIndexOffset: semanticIndexOffset,
              childCount: state._itemCount),
        );
      });
}

class PagewiseSliverBlocGrid<T, V, E extends AnyListBloc<T, V>> extends Pagewise<T, V, E> {
  /// Creates a Pagewise SliverGrid with a crossAxisCount.
  ///
  /// All the properties are either those documented for normal [SliverGrid](https://docs.flutter.io/flutter/widgets/SliverGrid-class.html)
  /// or those inherited from [Pagewise]
  PagewiseSliverBlocGrid.count({
    required final int crossAxisCount,
    required final ItemBuilder itemBuilder,
    final Key? key,
    final bool addSemanticIndexes = true,
    final bool addAutomaticKeepAlives = true,
    final bool addRepaintBoundaries = true,
    final SemanticIndexCallback semanticIndexCallback = _kDefaultSemanticIndexCallback,
    final int semanticIndexOffset = 0,
    final double childAspectRatio = 1.0,
    final double crossAxisSpacing = 0.0,
    final double mainAxisSpacing = 0.0,
    final int pageSize = 20,
    final E? bloc,
    final bool showRetry = true,
  }) : super(
      pageSize: pageSize,
      key: key,
      pageLoadController: bloc,
      showRetry: showRetry,
      itemBuilder: itemBuilder,
      builder: (final PagewiseState state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(state._itemBuilder,
              addAutomaticKeepAlives: addAutomaticKeepAlives,
              addRepaintBoundaries: addRepaintBoundaries,
              addSemanticIndexes: addSemanticIndexes,
              semanticIndexCallback: semanticIndexCallback,
              semanticIndexOffset: semanticIndexOffset,
              childCount: state._itemCount),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndLoading(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              itemCount: state._itemCount),
        );
      });

  /// Creates a Pagewise SliverGrid with a maxCrossAxisExtent.
  ///
  /// All the properties are either those documented for normal [SliverGrid](https://docs.flutter.io/flutter/widgets/SliverGrid-class.html)
  /// or those inherited from [Pagewise]
  PagewiseSliverBlocGrid.extent({
    required final double maxCrossAxisExtent,
    required final ItemBuilder itemBuilder,
    final Key? key,
    final bool addSemanticIndexes = true,
    final bool addAutomaticKeepAlives = true,
    final bool addRepaintBoundaries = true,
    final SemanticIndexCallback semanticIndexCallback = _kDefaultSemanticIndexCallback,
    final int semanticIndexOffset = 0,
    final double childAspectRatio = 1.0,
    final double crossAxisSpacing = 0.0,
    final double mainAxisSpacing = 0.0,
    final int pageSize = 20,
    final E? bloc,
    final bool showRetry = true,
  }) : super(
      pageSize: pageSize,
      key: key,
      pageLoadController: bloc,
      showRetry: showRetry,
      itemBuilder: itemBuilder,
      builder: (final PagewiseState state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(state._itemBuilder,
              addAutomaticKeepAlives: addAutomaticKeepAlives,
              addRepaintBoundaries: addRepaintBoundaries,
              addSemanticIndexes: addSemanticIndexes,
              semanticIndexCallback: semanticIndexCallback,
              semanticIndexOffset: semanticIndexOffset,
              childCount: state._itemCount),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtentAndLoading(
              maxCrossAxisExtent: maxCrossAxisExtent,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              itemCount: state._itemCount),
        );
      });
}
