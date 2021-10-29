part of 'any_list_bloc.dart';

abstract class AnyListState extends Equatable {
  const AnyListState({
    required final this.hasData,
  });

  final bool hasData;

  @override
  List<Object> get props => [];
}

class StartState extends AnyListState {
  const StartState() : super(hasData: false);

  @override
  String toString() => 'StartState';
}

class AnyListLoading extends AnyListState {
  const AnyListLoading({
    required final bool hasData,
  }) : super(hasData: hasData);

  @override
  String toString() => 'AnyListLoading';
}

class AnyListError extends AnyListState {
  const AnyListError({
    required final bool hasData,
    required final this.error,
  }) : super(hasData: hasData);

  final Failure error;

  @override
  String toString() => 'AnyListError';
}

class AnyListDataFetched<Data, Search> extends AnyListState {
  const AnyListDataFetched({
    required final this.data,
    required final this.hasSingleData,
    required final this.singleData,
    required final bool hasData,
    required final this.search,
    final this.isRetry = false,
  }) : super(hasData: hasData);

  final List<Data> data;
  final bool hasSingleData;
  final Data singleData;
  final bool isRetry;
  final Search search;

  @override
  String toString() => 'AnyListDataFetched with data: ${data.length}';

  @override
  List<Object> get props => [data, data.length, isRetry];
}

class AnyListEmpty extends AnyListState {
  const AnyListEmpty() : super(hasData: false);

  @override
  String toString() => 'AnyListEmpty';
}
