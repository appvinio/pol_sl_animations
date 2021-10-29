part of 'any_fetch_bloc.dart';

abstract class AnyFetchState extends Equatable {
  const AnyFetchState();

  @override
  List<Object?> get props => [];
}

class InitialAnyFetchState extends AnyFetchState {}

class LoadingAnyFetchState extends AnyFetchState {
  const LoadingAnyFetchState();
}

class DataAnyFetchState<T> extends AnyFetchState {
  const DataAnyFetchState({required final this.data}) : assert(data != null);

  final T data;

  @override
  List<Object?> get props => [data];
}

class ErrorAnyFetchState extends AnyFetchState {
  const ErrorAnyFetchState({required final this.error});

  final Failure error;

  @override
  List<Object?> get props => [error];
}
