import 'package:aplikacja_sklep/core/presentation/blocs/any_fetch_bloc/any_fetch_bloc.dart';
import 'package:aplikacja_sklep/core/presentation/blocs/any_fetch_bloc/widgets/any_fetch_decoder.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';
import 'package:aplikacja_sklep/features/shop/presentation/blocs/basket_bloc/basket_bloc.dart';
import 'package:aplikacja_sklep/features/shop/presentation/blocs/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:aplikacja_sklep/features/shop/presentation/widgets/shop_loading_widget.dart';
import 'package:aplikacja_sklep/features/shop/presentation/widgets/shop_product.dart';
import 'package:aplikacja_sklep/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rubber/rubber.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with TickerProviderStateMixin {
  late final FetchProductsBloc fetchProductsBloc;
  late final RubberAnimationController controller;
  late final BasketBloc basketBloc;

  @override
  void initState() {
    fetchProductsBloc = sl()
      ..add(const DefaultAnyFetchEvent());
    basketBloc = sl();
    controller = RubberAnimationController(
      vsync: this,
      initialValue: 20,
      lowerBoundValue: AnimationControllerValue(pixel: 0),
      halfBoundValue: AnimationControllerValue(pixel: 300),
      upperBoundValue: AnimationControllerValue(pixel: 0.5),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: basketBloc,
      listener: (context, BasketState state) {
        if(state.basket.isEmpty) {
          controller.di;
        } else if(controller.isDismissed) {

        }
      },
      child: RubberBottomSheet(
        animationController: controller,
        upperLayer: Container(
          height: 300,
          width: double.infinity,
          color: Colors.red,
        ),
        lowerLayer: Scaffold(
          appBar: AppBar(
            shadowColor: CustomColors.whiteColor,
            backgroundColor: CustomColors.whiteColor,
            elevation: 10,
            centerTitle: true,
            title: Text(
              'appvinio',
              style: roboto.w800.colorBlack.s32,
            ),
          ),
          backgroundColor: CustomColors.whiteColor,
          body: SafeArea(
            child: AnyFetchDecoder<List<Product>>(
              anyFetchBloc: fetchProductsBloc,
              dataBuilder: (context, state) {
                return RefreshIndicator(
                  onRefresh: () async {
                    fetchProductsBloc.add(const DefaultAnyFetchEvent());
                  },
                  child: StaggeredGridView.countBuilder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                        child: ShopProduct(
                          product: state.data[index],
                          basketBloc: basketBloc,
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) {
                      return const StaggeredTile.fit(1);
                    },
                    crossAxisCount: 2,
                  ),
                );
              },
              loadingBuilder: (context, state) {
                return const ShopLoadingWidget();
              },
            ),
          ),
        ),
      ),
    );
  }
}
