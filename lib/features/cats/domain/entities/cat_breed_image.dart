import 'package:equatable/equatable.dart';

abstract class CatBreedImage extends Equatable {
  const CatBreedImage();

  String? get id;

  int? get width;

  int? get height;

  String? get url;
}
