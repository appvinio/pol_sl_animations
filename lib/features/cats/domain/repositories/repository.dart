import 'package:adoption_app/core/error/failures.dart';
import 'package:adoption_app/core/usecase/usecase.dart';
import 'package:adoption_app/features/cats/domain/entities/cat_breed.dart';
import 'package:adoption_app/features/cats/domain/use_cases/adopt_cat_use_case_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<CatBreed>>> fetchCatBreeds();
  Future<Either<Failure, bool>> adoptCat(AdoptCatParam params);
}
