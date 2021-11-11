import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:aplikacja_sklep/generated/l10n.dart';

class CatBreedSpecificDetail extends StatelessWidget {
  const CatBreedSpecificDetail({
    required this.title,
    required this.answer,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool answer;

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
        Text(
          answer ? S.of(context).detailsYes : S.of(context).detailsNo,
          style: roboto.s16.colorListText.w800,
        ),
      ],
    );
  }
}
