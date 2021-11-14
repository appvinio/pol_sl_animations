import 'package:flutter/material.dart';

abstract class CustomColors {
  static const whiteColor = Color(0xffFFFFFF);
  static const lightShadowColor = Color(0xFFF2F2F2);
  static const blackColor = Color(0xFF010c0e);
  static const darkGreyColor = Color(0xFF3d3d3d);
  static const greyColor = Colors.grey;
  static const lightGreyColor = Color(0xffe1e4f0);
  static const blueColor = Color(0xFF3778f8);
  static const lightOrangeColor = Color(0xFFffeadf);
  static const orangeColor = Color(0xFFfe7c34);
  static const redColor = Color(0xfff36162);

  static const shimmerColor = Colors.white;
  static const shimmerBaseColor = Color(0xFFEEEEEE);

  /// Theme
  static const primary = Color(0xFFFFFFFF);
  static const secondary = CustomColors.darkGreyColor;
  static const hint = Colors.grey;

  /// Custom colors
  static const background = Color(0xFFFFFFFF);
  static const listElement = Color(0x00FFFFFF);
  static const refreshIndicator = Colors.grey;
}
