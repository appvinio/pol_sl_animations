import 'package:flutter/material.dart';

class CatBreedSpecificContent extends StatelessWidget {
  const CatBreedSpecificContent({
    required this.children,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      /// image height - radius * 2 for the radius of the cat image
      padding: const EdgeInsets.only(top: 400 - 32 * 2),
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
