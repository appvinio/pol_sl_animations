import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';
import 'package:aplikacja_sklep/features/shop/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class FetchProductsUseCase extends UseCase<List<Product>, NoParams> {
  FetchProductsUseCase({required this.repository});

  final Repository repository;

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) {
    return repository.fetchProducts();
  }
}
