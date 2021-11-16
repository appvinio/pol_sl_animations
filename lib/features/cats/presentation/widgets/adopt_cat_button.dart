import 'package:any_animated_button/any_animated_button.dart';
import 'package:adoption_app/core/style/borders.dart';
import 'package:adoption_app/core/style/colors.dart';
import 'package:adoption_app/core/style/text_styles.dart';
import 'package:adoption_app/features/cats/domain/entities/cat_breed.dart';
import 'package:adoption_app/features/cats/presentation/blocs/adopt_cat/adopt_cat_bloc.dart';
import 'package:adoption_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:adoption_app/generated/l10n.dart';

class AdoptCatButton extends StatefulWidget {
  const AdoptCatButton({
    required this.catBreed,
    Key? key,
  }) : super(key: key);

  final CatBreed catBreed;

  @override
  _AdoptCatButtonState createState() => _AdoptCatButtonState();
}

class _AdoptCatButtonState extends State<AdoptCatButton> {
  late final AdoptCatBloc adoptCatBloc;

  @override
  void initState() {
    adoptCatBloc = sl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnyAnimatedButton(
      bloc: adoptCatBloc,
      defaultButtonParams: _defaultParams,
      progressButtonParams: _progressParams,
    );
  }

  AnyAnimatedButtonParams get _defaultParams {
    return AnyAnimatedButtonParams(
      height: 52,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: Borders.radius8All,
        color: CustomColors.blueColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            adoptCatBloc.add(TriggerAnyAnimatedButtonEvent(widget.catBreed));
          },
          borderRadius: Borders.radius8All,
          child: Center(
            child: Text(
              S.of(context).adoption,
              style: roboto.bold.colorWhite.s16,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }

  AnyAnimatedButtonParams get _progressParams {
    return AnyAnimatedButtonParams(
      height: 52,
      width: 52,
      padding: const EdgeInsets.all(12.0),
      decoration: const BoxDecoration(
        borderRadius: Borders.radius16All,
        color: CustomColors.blueColor,
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
