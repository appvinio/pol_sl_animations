import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/cats/data/model/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/use_cases/adopt_cat_use_case_use_case.dart';
import 'package:dio/dio.dart';

abstract class DataSource {
  Future<List<CatBreed>> fetchCatBreeds(PaginationParams params);

  Future<bool> adoptCat(AdoptCatParam params);
}

class DataSourceImpl extends DataSource {
  DataSourceImpl({required this.source});

  final Dio source;

  @override
  Future<List<CatBreed>> fetchCatBreeds(PaginationParams params) async {
    final result = await source.get('breeds', queryParameters: {
      'page': params.page,
      'limit': 20,
    });

    /// should not be here but oh well, lets watch cat in a washing machine
    await Future.delayed(const Duration(seconds: 5));
    return result.data
        .map((element) => CatBreedModel.fromJson(element))
        .cast<CatBreed>()
        .toList();
  }

  @override
  Future<bool> adoptCat(AdoptCatParam params) async {
    // TODO(Bartek): maybe future feature ;)
    await Future.delayed(const Duration(seconds: 5));
    return true;
  }
}
