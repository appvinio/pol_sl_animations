part of 'any_fetch_bloc.dart';

abstract class AnyFetchEvent extends Equatable {
  const AnyFetchEvent();

  @override
  List<Object> get props => [];
}

class DefaultAnyFetchEvent extends AnyFetchEvent {
  const DefaultAnyFetchEvent();
}
