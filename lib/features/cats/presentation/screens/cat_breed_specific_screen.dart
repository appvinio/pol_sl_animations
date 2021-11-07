import 'package:aplikacja_sklep/core/navigator/navigator.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_image_widget.dart';
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
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: widget.breed.id,
              child: CatImageWidget(
                catBreedImage: widget.breed.image,
                height: 400,
              ),
            ),
            const SizedBox(height: 2000,)
          ],
        ),
      ),
    );
  }
}
