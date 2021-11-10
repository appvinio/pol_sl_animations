import 'package:aplikacja_sklep/core/navigator/navigator.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_breed_specific_content.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_breed_specific_image.dart';
import 'package:flutter/material.dart';

class CatBreedSpecificScreen extends StatefulWidget with NavigatedScreen {
  const CatBreedSpecificScreen({
    required this.breed,
    Key? key,
  }) : super(key: key);

  final CatBreed breed;

  @override
  State<CatBreedSpecificScreen> createState() => _CatBreedSpecificScreenState();

  @override
  String get routeName => 'cat_breed_specific_screen';
}

class _CatBreedSpecificScreenState extends State<CatBreedSpecificScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              transitionOnUserGestures: true,
              tag: widget.breed.id,
              child: CatBreedSpecificImage(
                breed: widget.breed,
                height: 400,
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: CatBreedSpecificContent(
              children: [
                const SizedBox(height: 16.0),
                Text(
                  widget.breed.name,
                  style: roboto.s32.w800,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
