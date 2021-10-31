import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ShopProduct extends StatelessWidget {
  const ShopProduct({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Stack(
        children: [
          FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            image: product.url,
            placeholder: kTransparentImage,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.whiteColor.withOpacity(0.8),
                    blurRadius: 10,
                    spreadRadius: 12,
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Text(
                  product.name,
                  textAlign: TextAlign.left,
                  style: roboto.w800.s16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
