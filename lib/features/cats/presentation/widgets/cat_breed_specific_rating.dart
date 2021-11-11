import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:flutter/material.dart';

class CatBreedSpecificRating extends StatelessWidget {
  const CatBreedSpecificRating({
    required this.title,
    required this.rating,
    Key? key,
  }) : super(key: key);

  final String title;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: roboto.s16.colorListText.w400,
          ),
        ),
        ...List.generate(
          rating,
          (index) => const Icon(
            Icons.star,
            color: CustomColors.primary,
            size: 20,
          ),
        ),
      ],
    );
  }
}
