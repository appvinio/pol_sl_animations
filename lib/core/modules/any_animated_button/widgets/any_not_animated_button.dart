import 'package:flutter/material.dart';
import 'package:aplikacja_sklep/core/modules/any_animated_button/any_animated_button_params.dart';

class AnyNotAnimatedButton extends StatelessWidget {
  const AnyNotAnimatedButton({
    required final this.params,
    final Key? key,
  }) : super(key: key);

  final AnyAnimatedButtonParams params;

  @override
  Widget build(final BuildContext context) {
    return Container(
      key: params.key,
      width: params.width,
      height: params.height,
      alignment: params.alignment,
      padding: params.padding,
      margin: params.margin,
      decoration: params.decoration,
      foregroundDecoration: params.foregroundDecoration,
      transform: params.transform,
      color: params.color,
      child: params.child,
    );
  }
}
