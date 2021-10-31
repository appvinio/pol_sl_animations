import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';
import 'package:aplikacja_sklep/features/shop/presentation/blocs/basket_bloc/basket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ShopProduct extends StatelessWidget {
  const ShopProduct({
    required this.product,
    required this.basketBloc,
    Key? key,
  }) : super(key: key);

  final Product product;
  final BasketBloc basketBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          height: 130,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.cover,
              image: product.url,
              placeholder: kTransparentImage,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        product.name,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: roboto.w800.s16,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${product.price.toStringAsFixed(2)} zł',
                      style: roboto.colorGrey.w400,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 4.0),
              InkWell(
                onTap: () {
                  basketBloc.add(AddBasketProductEvent(product: product));
                },
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: Ink(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: CustomColors.whiteColor,
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
