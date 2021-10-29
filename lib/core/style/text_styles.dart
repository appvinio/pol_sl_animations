import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';

const robotoStyleName = 'Roboto';

CustomTextStyle get roboto => const Roboto();

class Roboto extends CustomTextStyle {
  const Roboto() : super._(fontFamily: robotoStyleName);
}

class CustomTextStyle extends TextStyle {
  const CustomTextStyle._({
    final bool inherit = true,
    final Color? color,
    final Color? backgroundColor,
    final double? fontSize,
    final FontWeight? fontWeight,
    final FontStyle? fontStyle,
    final double? letterSpacing,
    final double? wordSpacing,
    final TextBaseline? textBaseline,
    final double? height,
    final Locale? locale,
    final Paint? foreground,
    final Paint? background,
    final List<Shadow>? shadows,
    final List<FontFeature>? fontFeatures,
    final TextDecoration? decoration,
    final Color? decorationColor,
    final TextLeadingDistribution? leadingDistribution,
    final TextDecorationStyle? decorationStyle,
    final double? decorationThickness,
    final String? debugLabel,
    final String? fontFamily,
    final List<String>? fontFamilyFallback,
    final String? package,
  }) : super(
    inherit: inherit,
    color: color,
    backgroundColor: backgroundColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
    leadingDistribution: leadingDistribution,
    textBaseline: textBaseline,
    height: height,
    locale: locale,
    foreground: foreground,
    background: background,
    shadows: shadows,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
    decorationStyle: decorationStyle,
    decorationThickness: decorationThickness,
    debugLabel: debugLabel,
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    package: package,
  );

  CustomTextStyle get s12 => copyWith(fontSize: 12);

  CustomTextStyle get s10 => copyWith(fontSize: 10);

  CustomTextStyle get s14 => copyWith(fontSize: 14);

  CustomTextStyle get s16 => copyWith(fontSize: 16);

  CustomTextStyle get s18 => copyWith(fontSize: 18);

  CustomTextStyle get s21 => copyWith(fontSize: 21);

  CustomTextStyle get s22 => copyWith(fontSize: 22);

  CustomTextStyle get s23 => copyWith(fontSize: 23);

  CustomTextStyle get s26 => copyWith(fontSize: 26);

  CustomTextStyle get s28 => copyWith(fontSize: 28);

  CustomTextStyle get s32 => copyWith(fontSize: 32);

  CustomTextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  CustomTextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  CustomTextStyle get w800 => copyWith(fontWeight: FontWeight.w800);

  CustomTextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  CustomTextStyle get colorWhite => copyWith(color: CustomColors.whiteColor);

  CustomTextStyle get colorHintDefault => copyWith(color: CustomColors.whiteColor);

  CustomTextStyle get colorBlack => copyWith(color: CustomColors.whiteColor);

  CustomTextStyle get h17 => copyWith(height: 1.7);

  CustomTextStyle get h13 => copyWith(height: 1.3);

  CustomTextStyle get ls1 => copyWith(letterSpacing: 1);

  CustomTextStyle get underline => copyWith(decoration: TextDecoration.underline);

  @override
  CustomTextStyle copyWith({
    final bool? inherit,
    final Color? color,
    final Color? backgroundColor,
    final String? fontFamily,
    final List<String>? fontFamilyFallback,
    final double? fontSize,
    final FontWeight? fontWeight,
    final FontStyle? fontStyle,
    final double? letterSpacing,
    final double? wordSpacing,
    final TextBaseline? textBaseline,
    final double? height,
    final TextLeadingDistribution? leadingDistribution,
    final Locale? locale,
    final Paint? foreground,
    final Paint? background,
    final List<Shadow>? shadows,
    final List<FontFeature>? fontFeatures,
    final TextDecoration? decoration,
    final Color? decorationColor,
    final TextDecorationStyle? decorationStyle,
    final double? decorationThickness,
    final String? debugLabel,
    final TextOverflow? overflow,
  }) {
    return CustomTextStyle._(
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null ? color ?? this.color : null,
      backgroundColor: this.background == null && background == null ? backgroundColor ?? this.backgroundColor : null,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
    );
  }
}
