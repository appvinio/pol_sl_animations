import 'package:aplikacja_sklep/core/presentation/blocs/any_list/any_list_bloc.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/presentation/blocs/cat_breeds/cat_breeds_bloc.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/banner_adopt_pet.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_list_element.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/list_loading_widget.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/list_spacer.dart';
import 'package:aplikacja_sklep/gen/assets.gen.dart';
import 'package:aplikacja_sklep/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aplikacja_sklep/generated/l10n.dart';

class CatsScreen extends StatefulWidget {
  const CatsScreen({Key? key}) : super(key: key);

  @override
  _CatsScreenState createState() => _CatsScreenState();
}

class _CatsScreenState extends State<CatsScreen> with TickerProviderStateMixin {
  late final CatBreedsBloc catBreedsBloc;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder,
            Assets.images.catPlaceholder.path),
        null,
      );
      precachePicture(
        ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder, Assets.images.catPaw.path),
        null,
      );
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder,
            Assets.images.catPawOutlined.path),
        null,
      );
    });
    catBreedsBloc = sl()..add(const AnyListRefreshEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: RefreshIndicator(
        backgroundColor: CustomColors.refreshIndicator,
        onRefresh: () async {
          catBreedsBloc.add(const AnyListRefreshEvent());
        },
        child: SafeArea(
          child: BlocBuilder(
            bloc: catBreedsBloc,
            builder: (context, state) {
              if (state is AnyListDataFetched<CatBreed?, String?>) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const ListSpacer(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: BannerAdoptPet(),
                    ),
                    const ListSpacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        S.of(context).recommended,
                        style: roboto.s22.bold.colorDarkGrey,
                      ),
                    ),
                    const ListSpacer(),
                    ...state.data
                        .map((breed) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: CatListElement(catBreed: breed!),
                            ))
                        .toList()
                        .expand((element) => [element, const ListSpacer()])
                  ],
                );
              } else if (state is AnyListLoading) {
                return const ListLoadingWidget();
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
