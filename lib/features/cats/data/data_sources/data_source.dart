import 'package:aplikacja_sklep/core/usecase/usecase.dart';
import 'package:aplikacja_sklep/features/cats/data/model/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:dio/dio.dart';

abstract class DataSource {
  Future<List<CatBreed>> fetchCatBreeds(PaginationParams params);
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
    return result.data.map((element) => CatBreedModel.fromJson(element)).cast<CatBreed>().toList();
  }
}
