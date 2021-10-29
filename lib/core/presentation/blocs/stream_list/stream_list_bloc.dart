import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:aplikacja_sklep/core/error/failures.dart';

part 'stream_list_event.dart';

part 'stream_list_state.dart';

abstract class StreamListBloc<T> extends Bloc<StreamListEvent, StreamListState> {
  StreamListBloc() : super(LoadingStreamListState());

  late List<T> _list;
  List<T> get list => _list;
  late StreamSubscription<T> _dataStream;

  @override
  @mustCallSuper
  Stream<StreamListState> mapEventToState(final StreamListEvent event) async* {
    if (event is AddElementStreamListEvent<T>) {
      yield* _mapAddElementStreamListEvent(event);
    } else if(event is InitializeStreamListEvent) {
      yield* _mapInitializeStreamListEvent();
    }
  }

  Stream<StreamListState> _mapInitializeStreamListEvent() async* {
    final result = await getStream();
    yield* result.fold((final error) async* {
      yield ErrorStreamListState();
    }, (final data) async* {
      _dataStream = data.listen((final event) {
        add(AddElementStreamListEvent<T>(data: event));
      });
      _list = <T>[];
      yield DataStreamListState(data: List.from(_list));
    });
  }

  Stream<StreamListState> _mapAddElementStreamListEvent(final AddElementStreamListEvent<T> event) async* {
    if(!elementIsOnTheListChecker(event.data)) {
      _list = List.from(_list)..add(event.data);
      yield DataStreamListState(data: _list);
    } else {
      replaceElementOnTheList(event.data);
      yield DataStreamListState(data: _list);
    }
  }

  bool elementIsOnTheListChecker(final T element) => false;

  List<T> replaceElementOnTheList(final T element) {
    return list;
  }

  Future<Either<Failure, Stream<T>>> getStream();

  @override
  @mustCallSuper
  Future<void> close() {
    _dataStream.cancel();
    return super.close();
  }
}
