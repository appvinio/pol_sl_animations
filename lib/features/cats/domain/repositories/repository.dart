import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<CatBreed>>> fetchCatBreeds(PaginationParams params);
}
