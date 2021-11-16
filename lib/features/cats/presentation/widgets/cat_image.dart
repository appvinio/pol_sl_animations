import 'package:adoption_app/core/style/borders.dart';
import 'package:adoption_app/features/cats/domain/entities/cat_breed_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CatImage extends StatelessWidget {
  const CatImage({
    required this.catBreedImage,
    this.borderRadius = Borders.radius10All,
    Key? key,
  }) : super(key: key);

  final CatBreedImage? catBreedImage;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    if (catBreedImage?.url != null) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: catBreedImage!.url!,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
