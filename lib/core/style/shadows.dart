import 'package:adoption_app/core/style/colors.dart';
import 'package:flutter/cupertino.dart';

abstract class Shadows {
  static const BoxShadow whiteShadow = BoxShadow(
    color: CustomColors.lightShadowColor,
    offset: Offset(0, 4),
    blurRadius: 70,
  );
}
