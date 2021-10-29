part of 'any_animated_button_bloc.dart';

abstract class AnyAnimatedButtonEvent extends Equatable {
  const AnyAnimatedButtonEvent();

  @override
  List<Object?> get props => [];
}

class TriggerAnyAnimatedButtonEvent<T extends Object> extends AnyAnimatedButtonEvent {
  const TriggerAnyAnimatedButtonEvent({final this.object});

  final T? object;

  @override
  List<Object?> get props => [object];
}
