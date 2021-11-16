import 'package:adoption_app/core/error/failures.dart';
import 'package:adoption_app/core/usecase/usecase.dart';
import 'package:adoption_app/features/cats/domain/entities/cat_breed.dart';
import 'package:adoption_app/features/cats/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class FetchCatBreedsUseCase extends UseCase<List<CatBreed>, NoParams> {
  FetchCatBreedsUseCase({required this.repository});

  final Repository repository;

  @override
  Future<Either<Failure, List<CatBreed>>> call(NoParams params) {
    return repository.fetchCatBreeds();
  }
}
