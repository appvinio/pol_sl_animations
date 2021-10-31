import 'package:aplikacja_sklep/core/presentation/blocs/any_fetch_bloc/any_fetch_bloc.dart';
import 'package:aplikacja_sklep/core/presentation/blocs/any_fetch_bloc/widgets/any_fetch_decoder.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';
import 'package:aplikacja_sklep/features/shop/presentation/blocs/fetch_products_bloc.dart';
import 'package:aplikacja_sklep/features/shop/presentation/widgets/shop_loading_widget.dart';
import 'package:aplikacja_sklep/features/shop/presentation/widgets/shop_product.dart';
import 'package:aplikacja_sklep/injection_container.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late final FetchProductsBloc fetchProductsBloc;

  @override
  void initState() {
    fetchProductsBloc = sl()..add(const DefaultAnyFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: SafeArea(
        child: AnyFetchDecoder<List<Product>>(
          anyFetchBloc: fetchProductsBloc,
          dataBuilder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                fetchProductsBloc.add(const DefaultAnyFetchEvent());
              },
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                itemCount: state.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    child: ShopProduct(product: state.data[index]),
                  );
                },
              ),
            );
          },
          loadingBuilder: (context, state) {
            return const ShopLoadingWidget();
          },
        ),
      ),
    );
  }
}
