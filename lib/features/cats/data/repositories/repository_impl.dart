import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/error/form_decoder.dart';
import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/cats/data/data_sources/data_source.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl({required this.dataSource});

  final DataSource dataSource;

  Future<Either<Failure, List<CatBreed>>> fetchCatBreeds(PaginationParams params) async {
    try {
      final result = await dataSource.fetchCatBreeds(params);
      return Right(result);
    } catch (error) {
      return Left(handleError(error, const FetchCatBreedsFailure()));
    }
  }
}
