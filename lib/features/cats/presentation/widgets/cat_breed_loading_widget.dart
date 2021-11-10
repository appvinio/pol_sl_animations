import 'package:aplikacja_sklep/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CatBreedLoadingWidget extends StatelessWidget {
  const CatBreedLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Assets.animations.catLoading.rive();
  }
}
