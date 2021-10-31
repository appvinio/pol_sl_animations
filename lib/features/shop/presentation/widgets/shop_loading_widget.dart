import 'package:flutter/material.dart';

class ShopLoadingWidget extends StatelessWidget {
  const ShopLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return const Center(child: Text('LOADING'));
      },
    );
  }
}
