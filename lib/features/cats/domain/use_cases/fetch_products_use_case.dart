import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class FetchCatBreedsUseCase extends UseCase<List<CatBreed>, PaginationParams> {
  FetchCatBreedsUseCase({required this.repository});

  final Repository repository;

  @override
  Future<Either<Failure, List<CatBreed>>> call(PaginationParams params) {
    return repository.fetchCatBreeds(params);
  }
}
