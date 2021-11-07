import 'dart:math';

import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class CatBreedLoadingWidget extends StatelessWidget {
  const CatBreedLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 8.0,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          child: _CatBreedLoadingWidgetElement(),
        );
      },
      staggeredTileBuilder: (int index) {
        return const StaggeredTile.fit(1);
      },
      crossAxisCount: 2,
    );
  }
}

class _CatBreedLoadingWidgetElement extends StatelessWidget {
  const _CatBreedLoadingWidgetElement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Shimmer.fromColors(
          highlightColor: CustomColors.shimmerColor,
          baseColor: CustomColors.shimmerBaseColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 130,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: Container(
                    width: double.infinity,
                    height: 30,
                    color: CustomColors.shimmerBaseColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ...List.generate(
                2,
                (index) {
                  return Container(
                    width: double.infinity,
                    height: 30,
                    color: CustomColors.shimmerBaseColor,
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}