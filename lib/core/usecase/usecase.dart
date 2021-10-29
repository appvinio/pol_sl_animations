import 'package:equatable/equatable.dart';
import 'package:aplikacja_sklep/core/app/type_aliases.dart';

abstract class UseCase<Type, Params> {
  FutureFailable<Type> call(final Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}