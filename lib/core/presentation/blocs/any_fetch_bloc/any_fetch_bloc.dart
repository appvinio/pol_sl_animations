import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikacja_sklep/core/error/failures.dart';

part 'any_fetch_event.dart';

part 'any_fetch_state.dart';

abstract class AnyFetchBloc<T> extends Bloc<AnyFetchEvent, AnyFetchState> {
  AnyFetchBloc({final AnyFetchState? initialState}) : super(initialState ?? const LoadingAnyFetchState());

  @override
  Stream<AnyFetchState> mapEventToState(final AnyFetchEvent event) async* {
    if (event is DefaultAnyFetchEvent) {
      yield* _mapDefaultAnyFetchEvent(event);
    }
  }

  Stream<AnyFetchState> _mapDefaultAnyFetchEvent(final DefaultAnyFetchEvent event) async* {
    yield const LoadingAnyFetchState();
    final result = await fetchData(event);
    yield* result.fold((final error) async* {
      yield ErrorAnyFetchState(error: error);
    }, (final data) async* {
      yield DataAnyFetchState<T>(data: data);
    });
  }

  Future<Either<Failure, T>> fetchData(final DefaultAnyFetchEvent event);
}
