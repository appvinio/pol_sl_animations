import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/error/form_decoder.dart';
import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/cats/data/data_sources/data_source.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/repositories/repository.dart';
import 'package:aplikacja_sklep/features/cats/domain/use_cases/adopt_cat_use_case_use_case.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl({required this.dataSource});

  final DataSource dataSource;

  @override
  Future<Either<Failure, List<CatBreed>>> fetchCatBreeds(
      PaginationParams params) async {
    try {
      final result = await dataSource.fetchCatBreeds(params);
      return Right(result);
    } catch (error) {
      return Left(handleError(error, const FetchCatBreedsFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> adoptCat(AdoptCatParam params) async {
    try {
      final result = await dataSource.adoptCat(params);
      return Right(result);
    } catch (error) {
      return Left(handleError(error, const CatAdoptionErrorFailure()));
    }
  }
}
