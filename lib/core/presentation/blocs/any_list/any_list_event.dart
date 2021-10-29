part of 'any_list_bloc.dart';

abstract class AnyListEvent<Data, Search> extends Equatable {
  const AnyListEvent();

  @override
  List<Object> get props => [];
}

class AnyListSearchEvent<Search> extends AnyListEvent {
  const AnyListSearchEvent({required final this.search});

  final Search search;

  @override
  String toString() => 'AnyListSearchEvent';
}

class AnyListRefreshEvent extends AnyListEvent {
  const AnyListRefreshEvent();

  @override
  String toString() => 'AnyListRefreshEvent';
}

class AnyListFetchNewPageEvent extends AnyListEvent {
  const AnyListFetchNewPageEvent();

  @override
  String toString() => 'AnyListFetchNewPageEvent';
}

class AnyListRetryEvent extends AnyListEvent {
  const AnyListRetryEvent();

  @override
  String toString() => 'AnyListRetryEvent';
}

class CleanAnyListEvent extends AnyListEvent {
  const CleanAnyListEvent();
}
