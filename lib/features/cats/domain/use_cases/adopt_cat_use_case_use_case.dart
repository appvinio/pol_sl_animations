import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AdoptCatUseCase extends UseCase<bool, AdoptCatParam> {
  AdoptCatUseCase({required this.repository});

  final Repository repository;

  @override
  Future<Either<Failure, bool>> call(AdoptCatParam params) {
    return repository.adoptCat(params);
  }
}

class AdoptCatParam extends Equatable {
  const AdoptCatParam({
    required this.catBreed,
  });

  final CatBreed catBreed;

  @override
  List<Object?> get props => [catBreed];
}
