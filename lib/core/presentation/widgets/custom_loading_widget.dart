import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
