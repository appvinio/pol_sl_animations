import 'package:aplikacja_sklep/core/presentation/blocs/any_list/any_list_bloc.dart';
import 'package:aplikacja_sklep/core/presentation/widgets/pagewise.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/presentation/blocs/cat_breeds/cat_breeds_bloc.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_breed_element.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_breed_loading_widget.dart';
import 'package:aplikacja_sklep/gen/assets.gen.dart';
import 'package:aplikacja_sklep/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CatBreedsScreen extends StatefulWidget {
  const CatBreedsScreen({Key? key}) : super(key: key);

  @override
  _CatBreedsScreenState createState() => _CatBreedsScreenState();
}

class _CatBreedsScreenState extends State<CatBreedsScreen>
    with TickerProviderStateMixin {
  late final CatBreedsBloc catBreedsBloc;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      precacheImage(Assets.images.catPaw, context);
      precacheImage(Assets.images.catPawOutlined, context);
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder,
            Assets.images.catPlaceholderPng.path),
        null,
      );    });
    catBreedsBloc = sl()..add(const AnyListRefreshEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteColor,
      body: RefreshIndicator(
        onRefresh: () async {
          catBreedsBloc.add(const AnyListRefreshEvent());
        },
        child: PagewiseGridBlocView<CatBreed, String, CatBreedsBloc>.count(
          bloc: catBreedsBloc,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            vertical: 40.0,
            horizontal: 8.0,
          ),
          itemBuilder: (context, state) {
            if (state is DataPagewiseState<CatBreed>) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 8.0,
                ),
                child: CatBreedElement(catBreed: state.element),
              );
            } else if (state is RefreshPagewiseState) {
              return const CatBreedLoadingWidget();
            } else {
              return const SizedBox();
            }
          },
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
