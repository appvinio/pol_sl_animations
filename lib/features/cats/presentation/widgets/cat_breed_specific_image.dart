import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CatBreedSpecificImage extends StatelessWidget {
  const CatBreedSpecificImage({
    required this.height,
    required this.breed,
    Key? key,
  }) : super(key: key);

  final double height;
  final CatBreed breed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ClipRRect(
        borderRadius:
            const BorderRadius.vertical(bottom: Radius.circular(32.0)),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Assets.images.catPlaceholderSvg
                    .svg(color: CustomColors.greyColor),
              ),
            ),
            if (breed.image?.url?.isNotEmpty ?? false)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: breed.image?.url ?? '',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
    ;
  }
}
