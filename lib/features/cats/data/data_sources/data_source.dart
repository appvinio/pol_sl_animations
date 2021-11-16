import 'package:adoption_app/features/cats/data/model/cat_breed.dart';
import 'package:adoption_app/features/cats/domain/entities/cat_breed.dart';
import 'package:adoption_app/features/cats/domain/use_cases/adopt_cat_use_case_use_case.dart';
import 'package:dio/dio.dart';

abstract class DataSource {
  Future<List<CatBreed>> fetchCatBreeds();

  Future<bool> adoptCat(AdoptCatParam params);
}

class DataSourceImpl extends DataSource {
  DataSourceImpl({required this.source});

  final Dio source;

  @override
  Future<List<CatBreed>> fetchCatBreeds() async {
    final result = await source.get('breeds', queryParameters: {
      'page': 0,
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
