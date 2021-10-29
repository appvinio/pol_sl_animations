import 'package:flutter/material.dart';

class AnyAnimatedButtonProgress extends StatelessWidget {
  const AnyAnimatedButtonProgress({
    required final this.padding,
    final Key? key,
    final this.color = Colors.white,
  }) : super(key: key);

  final Color color;
  final EdgeInsets padding;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          strokeWidth: 3.0,
        ),
      ),
    );
  }
}
