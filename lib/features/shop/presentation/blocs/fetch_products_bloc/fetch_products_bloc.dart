import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/presentation/blocs/any_fetch_bloc/any_fetch_bloc.dart';
import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';
import 'package:aplikacja_sklep/features/shop/domain/use_cases/fetch_products_use_case.dart';
import 'package:dartz/dartz.dart';

class FetchProductsBloc extends AnyFetchBloc<List<Product>> {
  FetchProductsBloc({required this.fetchProductsUseCase});

  final FetchProductsUseCase fetchProductsUseCase;

  @override
  Future<Either<Failure, List<Product>>> fetchData(DefaultAnyFetchEvent event) {
    return fetchProductsUseCase(const NoParams());
  }
}
