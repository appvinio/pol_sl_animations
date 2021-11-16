import 'package:adoption_app/features/cats/domain/entities/cat_breed_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_breed_image.g.dart';

@JsonSerializable()
class CatBreedImageModel extends CatBreedImage {
  const CatBreedImageModel({
    required this.height,
    required this.id,
    required this.url,
    required this.width,
  });

  factory CatBreedImageModel.fromJson(Map<String, dynamic> json) =>
      _$CatBreedImageModelFromJson(json);

  @override
  final int? height;

  @override
  final String? id;

  @override
  final String? url;

  @override
  final int? width;

  @override
  List<Object?> get props => [
        height,
        id,
        url,
        width,
      ];
}
