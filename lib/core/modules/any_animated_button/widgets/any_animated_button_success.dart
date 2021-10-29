import 'package:flutter/material.dart';

class AnyAnimatedButtonSuccess extends StatelessWidget {
  const AnyAnimatedButtonSuccess({
    required final this.padding,
    final this.color = Colors.white,
    final Key? key,
  }) : super(key: key);

  final Color color;
  final EdgeInsets padding;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: padding,
      child: Icon(
        Icons.check,
        color: color,
      ),
    );
  }
}
