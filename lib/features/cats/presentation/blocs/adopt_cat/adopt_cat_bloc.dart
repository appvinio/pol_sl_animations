import 'package:any_animated_button/any_animated_button.dart';
import 'package:aplikacja_sklep/core/error/failures.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/use_cases/adopt_cat_use_case_use_case.dart';
import 'package:dartz/dartz.dart';

class AdoptCatBloc extends AnyAnimatedButtonBloc<CatBreed, bool, Failure> {
  AdoptCatBloc({required this.adoptCatUseCase});

  final AdoptCatUseCase adoptCatUseCase;

  @override
  Future<Either<Failure, bool>> asyncAction(CatBreed input) {
    return adoptCatUseCase(AdoptCatParam(catBreed: input));
  }
}
