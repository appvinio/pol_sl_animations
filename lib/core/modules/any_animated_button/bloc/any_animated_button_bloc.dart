import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:aplikacja_sklep/core/error/failures.dart';

part 'any_animated_button_event.dart';

part 'any_animated_button_state.dart';

abstract class AnyAnimatedButtonBloc<Receiving extends Object, Returning extends Object?>
    extends Bloc<AnyAnimatedButtonEvent, AnyAnimatedButtonState> {
  AnyAnimatedButtonBloc() : super(const DefaultAnyAnimatedButtonState());

  @override
  Stream<AnyAnimatedButtonState> mapEventToState(final AnyAnimatedButtonEvent event) async* {
    if (event is TriggerAnyAnimatedButtonEvent<Receiving>) {
      yield* _trigger(event);
    } else {
      throw Exception('wrong invocation of AnyAnimatedBloc');
    }
  }

  Stream<AnyAnimatedButtonState> _trigger(final TriggerAnyAnimatedButtonEvent<Receiving> event) async* {
    yield const ProgressAnyAnimatedButtonState();
    final Either<Failure, Returning> result = await asyncAction(event);
    yield* result.fold(
      (final Failure failure) async* {
        yield ErrorAnyAnimatedButtonState(failure);
      },
      (final Returning data) async* {
        yield SuccessAnyAnimatedButtonState<Returning>(data);
      },
    );
    await Future.delayed(const Duration(milliseconds: 500));
    yield const DefaultAnyAnimatedButtonState();
  }

  Future<Either<Failure, Returning>> asyncAction(final TriggerAnyAnimatedButtonEvent<Receiving> event);
}
