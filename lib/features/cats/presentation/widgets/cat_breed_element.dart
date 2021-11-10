import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/presentation/screens/cat_breed_specific_screen.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_image_widget.dart';
import 'package:aplikacja_sklep/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CatBreedElement extends StatefulWidget {
  const CatBreedElement({
    required this.catBreed,
    Key? key,
  }) : super(key: key);

  final CatBreed catBreed;

  @override
  State<CatBreedElement> createState() => _CatBreedElementState();
}

class _CatBreedElementState extends State<CatBreedElement> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CatBreedSpecificScreen(
          breed: widget.catBreed,
        ).addScreen(context);
      },
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: CustomColors.listElement,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: widget.catBreed.id,
              child: CatImageWidget(
                catBreedImage: widget.catBreed.image,
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          widget.catBreed.name,
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: roboto.w800.s16.colorListText,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: CustomColors.listElement,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      child: Ink(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: CustomColors.listElement,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: isSelected
                            ? Assets.images.catPaw
                                .svg(color: CustomColors.listText)
                            : Assets.images.catPawOutlined
                                .svg(color: CustomColors.listText),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
