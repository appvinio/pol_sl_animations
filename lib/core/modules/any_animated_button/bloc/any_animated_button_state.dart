part of 'any_animated_button_bloc.dart';

abstract class AnyAnimatedButtonState extends Equatable {
  const AnyAnimatedButtonState();

  @override
  List<Object?> get props => [];
}

class DefaultAnyAnimatedButtonState extends AnyAnimatedButtonState {
  const DefaultAnyAnimatedButtonState();

  @override
  List<Object?> get props => [];
}

class ProgressAnyAnimatedButtonState extends AnyAnimatedButtonState {
  const ProgressAnyAnimatedButtonState();

  @override
  List<Object?> get props => [];
}

class ErrorAnyAnimatedButtonState extends AnyAnimatedButtonState {
  const ErrorAnyAnimatedButtonState(this.failure);

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class SuccessAnyAnimatedButtonState<G extends Object?> extends AnyAnimatedButtonState {
  const SuccessAnyAnimatedButtonState(this.object);

  final G object;

  @override
  List<Object?> get props => [object];
}
