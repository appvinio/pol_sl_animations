import 'package:adoption_app/core/error/failures.dart';
import 'package:adoption_app/core/presentation/blocs/any_fetch_bloc/any_fetch_bloc.dart';
import 'package:adoption_app/core/usecase/usecase.dart';
import 'package:adoption_app/features/cats/domain/entities/cat_breed.dart';
import 'package:adoption_app/features/cats/domain/use_cases/fetch_products_use_case.dart';
import 'package:dartz/dartz.dart';

class CatBreedsBloc extends AnyFetchBloc<List<CatBreed>> {
  CatBreedsBloc({
    required this.fetchCatBreedsUseCase,
  });

  final FetchCatBreedsUseCase fetchCatBreedsUseCase;

  @override
  Future<Either<Failure, List<CatBreed>>> fetchData(
      DefaultAnyFetchEvent event) {
    return fetchCatBreedsUseCase(const NoParams());
  }
}
