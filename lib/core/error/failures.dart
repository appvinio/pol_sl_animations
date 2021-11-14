import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [errorMessage];

  String get errorMessage => '';

  @override
  bool? get stringify => true;
}

class FetchCatBreedsFailure extends Failure {
  const FetchCatBreedsFailure();
}

class CatAdoptionErrorFailure extends Failure {
  const CatAdoptionErrorFailure();
}
