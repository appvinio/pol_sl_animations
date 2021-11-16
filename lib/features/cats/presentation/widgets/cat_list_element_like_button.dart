import 'package:adoption_app/core/style/borders.dart';
import 'package:adoption_app/core/style/colors.dart';
import 'package:adoption_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CatListElementLikeButton extends StatefulWidget {
  const CatListElementLikeButton({Key? key}) : super(key: key);

  @override
  _CatListElementLikeButtonState createState() =>
      _CatListElementLikeButtonState();
}

class _CatListElementLikeButtonState extends State<CatListElementLikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: isLiked
            ? CustomColors.orangeColor.withOpacity(0.2)
            : CustomColors.greyColor.withOpacity(0.2),
        highlightColor: isLiked
            ? CustomColors.orangeColor.withOpacity(0.2)
            : CustomColors.greyColor.withOpacity(0.2),
        onTap: () {
          setState(() {
            isLiked = !isLiked;
          });
        },
        borderRadius: Borders.radius16All,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: Borders.radius16All,
            border: Border.all(
              color:
                  isLiked ? CustomColors.orangeColor : CustomColors.greyColor,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child:
                (isLiked ? Assets.images.catPaw : Assets.images.catPawOutlined)
                    .svg(
              height: 20,
              color:
                  isLiked ? CustomColors.orangeColor : CustomColors.greyColor,
            ),
          ),
        ),
      ),
    );
  }
}
