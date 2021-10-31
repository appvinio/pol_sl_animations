import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<Product>>> fetchProducts();
}
