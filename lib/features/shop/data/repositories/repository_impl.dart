import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/error/form_decoder.dart';
import 'package:aplikacja_sklep/features/shop/data/data_sources/data_source.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';
import 'package:aplikacja_sklep/features/shop/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl({required this.dataSource});

  final DataSource dataSource;

  Future<Either<Failure, List<Product>>> fetchProducts() async {
    try {
      final result = await dataSource.fetchProducts();
      return Right(result);
    } catch (error) {
      return Left(handleError(error, const FetchProductsFailure()));
    }
  }
}
