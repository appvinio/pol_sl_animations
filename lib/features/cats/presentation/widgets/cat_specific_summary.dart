import 'package:adoption_app/core/style/borders.dart';
import 'package:adoption_app/core/style/colors.dart';
import 'package:adoption_app/core/style/shadows.dart';
import 'package:adoption_app/core/style/text_styles.dart';
import 'package:adoption_app/features/cats/domain/entities/cat_breed.dart';
import 'package:adoption_app/features/cats/presentation/widgets/cat_image.dart';
import 'package:adoption_app/features/cats/presentation/widgets/list_spacer.dart';
import 'package:flutter/material.dart';
import 'package:adoption_app/generated/l10n.dart';

class CatSpecificSummary extends StatelessWidget {
  const CatSpecificSummary({
    required this.catBreed,
    Key? key,
  }) : super(key: key);

  final CatBreed catBreed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: CustomColors.whiteColor,
        boxShadow: [
          Shadows.whiteShadow,
        ],
        borderRadius: Borders.radius32All,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: catBreed.id,
              child: CatImage(
                catBreedImage: catBreed.image,
                borderRadius: Borders.radius32All,
              ),
            ),
          ),
          const ListSpacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              catBreed.name,
              style: roboto.bold.colorDarkGrey.s28,
            ),
          ),
          const ListSpacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).origin,
                        style: roboto.colorGrey.s14,
                      ),
                      TextSpan(
                        text: catBreed.origin,
                        style: roboto.bold.colorDarkGrey.s14,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).height,
                        style: roboto.colorGrey.s14,
                      ),
                      TextSpan(
                        text: S.of(context).centimeters(catBreed.sheddingLevel),
                        style: roboto.bold.colorDarkGrey.s14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ListSpacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: catBreed.isNatural
                            ? S.of(context).male
                            : S.of(context).female,
                        style: roboto.bold.colorDarkGrey.s14,
                      ),
                      TextSpan(
                        text: " | ",
                        style: roboto.bold.colorGrey.s14,
                      ),
                      TextSpan(
                        text: S.of(context).yearsOld(catBreed.sheddingLevel),
                        style: roboto.bold.colorDarkGrey.s14,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).weight,
                        style: roboto.colorGrey.s14,
                      ),
                      TextSpan(
                        text: S.of(context).kilograms(catBreed.sheddingLevel),
                        style: roboto.bold.colorDarkGrey.s14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
