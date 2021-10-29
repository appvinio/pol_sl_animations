import 'package:flutter/material.dart';

class AnyAnimatedButtonError extends StatelessWidget {
  const AnyAnimatedButtonError({
    required final this.padding,
    final Key? key,
    final this.color = Colors.white,
  }) : super(key: key);

  final Color color;
  final EdgeInsets padding;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: padding,
      child: Icon(
        Icons.close,
        color: color,
      ),
    );
  }
}
