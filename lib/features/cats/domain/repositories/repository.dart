import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/use_cases/adopt_cat_use_case_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<CatBreed>>> fetchCatBreeds(PaginationParams params);
  Future<Either<Failure, bool>> adoptCat(AdoptCatParam params);
}
