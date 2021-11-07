import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/core/presentation/blocs/any_list/any_list_bloc.dart';
import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/use_cases/fetch_products_use_case.dart';
import 'package:dartz/dartz.dart';

class CatBreedsBloc extends AnyListBloc<CatBreed, String> {
  CatBreedsBloc({
    required this.fetchCatBreedsUseCase,
  });

  @override
  int get firstPageNum => 0;

  final FetchCatBreedsUseCase fetchCatBreedsUseCase;

  @override
  Future<Either<Failure, List<CatBreed>>> fetchForPage(
      int page, String? search) {
    return fetchCatBreedsUseCase(PaginationParams(page: page));
  }
}
