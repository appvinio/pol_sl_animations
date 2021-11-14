import 'package:aplikacja_sklep/core/style/borders.dart';
import 'package:aplikacja_sklep/core/style/shadows.dart';
import 'package:aplikacja_sklep/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BannerAdoptPet extends StatelessWidget {
  const BannerAdoptPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          Shadows.whiteShadow,
        ]
      ),
      child: ClipRRect(
        borderRadius: Borders.radius16All,
        child: Assets.images.bannerAdopt.image(fit: BoxFit.fitWidth),
      ),
    );
  }
}
