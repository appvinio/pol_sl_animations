import 'package:aplikacja_sklep/core/navigator/navigator.dart';
import 'package:aplikacja_sklep/core/style/borders.dart';
import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/core/style/shadows.dart';
import 'package:aplikacja_sklep/core/style/text_styles.dart';
import 'package:aplikacja_sklep/features/cats/domain/entities/cat_breed.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/adopt_cat_button.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_image.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_like_button.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/cat_specific_summary.dart';
import 'package:aplikacja_sklep/features/cats/presentation/widgets/list_spacer.dart';
import 'package:flutter/material.dart';
import 'package:aplikacja_sklep/generated/l10n.dart';
import 'package:flutter/rendering.dart';

class CatSpecificScreen extends StatefulWidget with NavigatedScreen {
  const CatSpecificScreen({
    required this.catBreed,
    Key? key,
  }) : super(key: key);

  final CatBreed catBreed;

  @override
  _CatSpecificScreenState createState() => _CatSpecificScreenState();

  @override
  String get routeName => 'cat_specific_screen';
}

class _CatSpecificScreenState extends State<CatSpecificScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          S.of(context).pet,
          style: roboto.s16.colorBlack,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: Borders.radius32All,
              child: Ink(
                decoration: const BoxDecoration(
                    color: CustomColors.lightGreyColor,
                    borderRadius: Borders.radius32All),
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: CustomColors.greyColor,
                  size: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const ListSpacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CatSpecificSummary(
                  catBreed: widget.catBreed,
                ),
              ),
              const ListSpacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  S.of(context).details,
                  style: roboto.s20.bold.colorDarkGrey,
                ),
              ),
              const SizedBox(height: 12.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  widget.catBreed.description,
                  style: roboto.s14.colorGrey,
                ),
              ),
              const ListSpacer(),
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CatLikeButton(),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: AdoptCatButton(
                        catBreed: widget.catBreed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
