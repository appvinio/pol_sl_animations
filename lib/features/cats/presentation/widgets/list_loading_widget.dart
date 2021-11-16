import 'package:adoption_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ListLoadingWidget extends StatelessWidget {
  const ListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Assets.animations.catLoading.rive());
  }
}
