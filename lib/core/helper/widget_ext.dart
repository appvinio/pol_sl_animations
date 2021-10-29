import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget extPadding({final double horizontal = 0.0, final double vertical = 0.0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
