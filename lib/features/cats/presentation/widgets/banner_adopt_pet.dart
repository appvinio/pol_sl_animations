import 'package:adoption_app/core/style/borders.dart';
import 'package:adoption_app/core/style/shadows.dart';
import 'package:adoption_app/gen/assets.gen.dart';
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
