import 'package:aplikacja_sklep/core/style/borders.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/shadows.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/presentation/screens/cat_specific_screen.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_image.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_list_element_like_button.dart';
import 'package:flutter/material.dart';
import 'package:aplikacja_sklep/generated/l10n.dart';

class CatListElement extends StatefulWidget {
  const CatListElement({
    required this.catBreed,
    Key? key,
  }) : super(key: key);

  final CatBreed catBreed;

  @override
  State<CatListElement> createState() => _CatListElementState();
}

class _CatListElementState extends State<CatListElement> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          borderRadius: Borders.radius16All,
          color: Colors.white,
          boxShadow: [
            Shadows.whiteShadow,
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            CatSpecificScreen(catBreed: widget.catBreed).addScreen(context);
          },
          borderRadius: Borders.radius16All,
          child: SizedBox(
            height: 120,
            width: double.infinity,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                      tag: widget.catBreed.id,
                      child: CatImage(
                        catBreedImage: widget.catBreed.image,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.catBreed.name,
                          style: roboto.colorDarkGrey.s18.bold,
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              color: CustomColors.greyColor,
                              size: 20.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              widget.catBreed.origin,
                              style: roboto.colorGrey,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: S.of(context).origin,
                                style: roboto.bold.colorDarkGrey.s16,
                              ),
                              TextSpan(
                                text: widget.catBreed.origin,
                                style: roboto.colorGrey.s16,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.catBreed.isNatural
                                    ? S.of(context).male
                                    : S.of(context).female,
                                style: roboto.bold.colorDarkGrey.s10,
                              ),
                              TextSpan(
                                text: " | ",
                                style: roboto.bold.colorGrey.s10,
                              ),
                              TextSpan(
                                text: S
                                    .of(context)
                                    .yearsOld(widget.catBreed.sheddingLevel),
                                style: roboto.bold.colorDarkGrey.s10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CatListElementLikeButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
