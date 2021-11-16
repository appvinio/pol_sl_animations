import 'package:flutter/material.dart';
import 'package:adoption_app/core/presentation/widgets/default_error_widget.dart';

class DefaultErrorScreen extends StatelessWidget {
  const DefaultErrorScreen({
    final this.onRefresh,
    final Key? key,
  }) : super(key: key);

  final void Function()? onRefresh;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultErrorWidget(
          onRefresh: onRefresh,
        ),
      ),
    );
  }
}
