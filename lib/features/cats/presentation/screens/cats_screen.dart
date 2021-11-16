import 'package:adoption_app/core/presentation/blocs/any_fetch_bloc/any_fetch_bloc.dart';
import 'package:adoption_app/core/presentation/blocs/any_fetch_bloc/widgets/any_fetch_decoder.dart';
import 'package:adoption_app/core/presentation/blocs/any_list/any_list_bloc.dart';
import 'package:adoption_app/core/style/colors.dart';
import 'package:adoption_app/core/style/text_styles.dart';
import 'package:adoption_app/features/cats/domain/entities/cat_breed.dart';
import 'package:adoption_app/features/cats/presentation/blocs/cat_breeds/cat_breeds_bloc.dart';
import 'package:adoption_app/features/cats/presentation/widgets/banner_adopt_pet.dart';
import 'package:adoption_app/features/cats/presentation/widgets/cat_list_element.dart';
import 'package:adoption_app/features/cats/presentation/widgets/list_loading_widget.dart';
import 'package:adoption_app/features/cats/presentation/widgets/list_spacer.dart';
import 'package:adoption_app/gen/assets.gen.dart';
import 'package:adoption_app/injection_container.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:adoption_app/generated/l10n.dart';

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
    catBreedsBloc = sl()..add(const DefaultAnyFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: AnyFetchDecoder(
          anyFetchBloc: catBreedsBloc,
          dataBuilder: (context, state) {
            if (state is DataAnyFetchState<List<CatBreed>>) {
              return RefreshIndicator(
                backgroundColor: CustomColors.refreshIndicator,
                onRefresh: () async {
                  catBreedsBloc.add(const DefaultAnyFetchEvent());
                },
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(child: ListSpacer()),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: BannerAdoptPet(),
                      ),
                    ),
                    const SliverToBoxAdapter(child: ListSpacer()),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          S.of(context).recommended,
                          style: roboto.s22.bold.colorDarkGrey,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: ListSpacer()),
                    LiveSliverList(
                      visibleFraction: 0.05,
                      showItemInterval: Duration.zero,
                      showItemDuration: const Duration(milliseconds: 300),
                      itemCount: state.data.length,
                      controller: ScrollController(),
                      itemBuilder: (context, index, animation) {
                        return FadeTransition(
                          opacity: Tween<double>(
                            begin: 0,
                            end: 1,
                          ).animate(animation),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-0.1, 0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child:
                                  CatListElement(catBreed: state.data[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else if (state is AnyListLoading) {
              return const ListLoadingWidget();
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
