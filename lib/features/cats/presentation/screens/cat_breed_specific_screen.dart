import 'package:aplikacja_sklep/core/navigator/navigator.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_breed_specific_detail.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_breed_specific_image.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_breed_specific_rating.dart';
import 'package:flutter/material.dart';
import 'package:aplikacja_sklep/generated/l10n.dart';

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
      backgroundColor: CustomColors.background,
      body: Column(
        children: [
          Hero(
            transitionOnUserGestures: true,
            tag: widget.breed.id,
            child: CatBreedSpecificImage(
              breed: widget.breed,
              height: 400,
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              children: [
                Text(
                  widget.breed.name,
                  textAlign: TextAlign.center,
                  style: roboto.colorListText.w800.s32,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificRating(
                  title: S.of(context).intelligence,
                  rating: widget.breed.intelligence,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificRating(
                  title: S.of(context).adaptability,
                  rating: widget.breed.adaptability,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificRating(
                  title: S.of(context).socialNeeds,
                  rating: widget.breed.socialNeeds,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificRating(
                  title: S.of(context).sheddingLevel,
                  rating: widget.breed.sheddingLevel,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificRating(
                  title: S.of(context).energyLevel,
                  rating: widget.breed.energyLevel,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificRating(
                  title: S.of(context).dogFriendly,
                  rating: widget.breed.dogFriendly,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificRating(
                  title: S.of(context).vocalisation,
                  rating: widget.breed.vocalisation,
                ),
                const SizedBox(height: 32.0),
                Text(
                  S.of(context).details,
                  style: roboto.w800.colorListText.s32,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificDetail(
                  title: S.of(context).isHairless,
                  answer: widget.breed.isHairless,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificDetail(
                  title: S.of(context).isNatural,
                  answer: widget.breed.isNatural,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificDetail(
                  title: S.of(context).isHypoallergenic,
                  answer: widget.breed.isHypoallergenic,
                ),
                const SizedBox(height: 16.0),
                CatBreedSpecificDetail(
                  title: S.of(context).isIndoor,
                  answer: widget.breed.isIndoor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
