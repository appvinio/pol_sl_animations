import 'package:equatable/equatable.dart';
import 'package:adoption_app/core/app/type_aliases.dart';

abstract class UseCase<Type, Params> {
  FutureFailable<Type> call(final Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}

class PaginationParams extends Equatable {
  const PaginationParams({required this.page});

  final int page;

  @override
  List<Object?> get props => [page];
}
