import 'package:aplikacja_sklep/core/modules/any_animated_button/any_animated_button_params.dart';
import 'package:aplikacja_sklep/core/modules/any_animated_button/widgets/any_not_animated_button.dart';
import 'package:aplikacja_sklep/core/style/borders.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CatLikeButton extends StatefulWidget {
  const CatLikeButton({Key? key}) : super(key: key);

  @override
  _CatLikeButtonState createState() => _CatLikeButtonState();
}

class _CatLikeButtonState extends State<CatLikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return AnyNotAnimatedButton(
      params: AnyAnimatedButtonParams(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          borderRadius: Borders.radius8All,
          color: isLiked
              ? CustomColors.lightOrangeColor
              : CustomColors.lightGreyColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
            borderRadius: Borders.radius8All,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (isLiked
                      ? Assets.images.catPaw
                      : Assets.images.catPawOutlined)
                  .svg(
                      color: isLiked
                          ? CustomColors.orangeColor
                          : CustomColors.greyColor,
                      height: 24),
            ),
          ),
        ),
      ),
    );
  }
}
