import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikacja_sklep/core/modules/any_animated_button/any_animated_button_params.dart';
import 'package:aplikacja_sklep/core/modules/any_animated_button/bloc/any_animated_button_bloc.dart';
import 'package:aplikacja_sklep/core/modules/any_animated_button/widgets/any_not_animated_button.dart';

class AnyAnimatedButton extends StatefulWidget {
  const AnyAnimatedButton({
    required final this.bloc,
    required final this.defaultButtonParams,
    final this.progressButtonParams,
    final this.successButtonParams,
    final this.errorButtonParams,
    final Key? key,
  }) : super(key: key);

  final AnyAnimatedButtonBloc bloc;
  final AnyAnimatedButtonParams defaultButtonParams;
  final AnyAnimatedButtonParams? progressButtonParams;
  final AnyAnimatedButtonParams? successButtonParams;
  final AnyAnimatedButtonParams? errorButtonParams;

  @override
  // ignore: library_private_types_in_public_api
  _AnyAnimatedButtonState createState() => _AnyAnimatedButtonState();
}

class _AnyAnimatedButtonState extends State<AnyAnimatedButton> {
  late AnyAnimatedButtonParams _progressParams;
  late AnyAnimatedButtonParams _successParams;
  late AnyAnimatedButtonParams _errorParams;
  late AnyAnimatedButtonParams _defaultParams;

  late double _maxHeight;
  late AnyAnimatedButtonParams _params;

  late final GlobalKey _key;

  @override
  void initState() {
    _defaultParams = widget.defaultButtonParams;
    _progressParams = widget.progressButtonParams ?? AnyAnimatedButtonParams.progressParams();
    _successParams = widget.successButtonParams ?? AnyAnimatedButtonParams.successParams();
    _errorParams = widget.errorButtonParams ?? AnyAnimatedButtonParams.errorParams();

    _maxHeight = _getMaxHeight();
    _params = widget.defaultButtonParams;

    _key = GlobalKey();
    if (_defaultParams.width == null || _defaultParams.width!.isInfinite) {
      WidgetsBinding.instance!.addPostFrameCallback((final _) {
        setState(() {
          // ignore: cast_nullable_to_non_nullable
          final RenderBox button = _key.currentContext!.findRenderObject() as RenderBox;
          _defaultParams = _defaultParams.copyWith(width: button.size.width);
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: _maxHeight,
      child: Center(
        child: BlocBuilder<AnyAnimatedButtonBloc, AnyAnimatedButtonState>(
          bloc: widget.bloc,
          builder: (final BuildContext context, final AnyAnimatedButtonState state) {
            _params = _getParamsFromState(state);

            return _defaultParams.width == null || _defaultParams.width!.isInfinite
                ? AnyNotAnimatedButton(params: _defaultParams.copyWith(key: _key))
                : AnimatedContainer(
                    key: _key,
                    duration: const Duration(milliseconds: 300),
                    width: _params.width ?? _defaultParams.width,
                    height: _params.height,
                    alignment: _params.alignment,
                    padding: _params.padding,
                    margin: _params.margin,
                    decoration: _params.decoration,
                    foregroundDecoration: _params.foregroundDecoration,
                    transform: _params.transform,
                    color: _params.color,
                    child: _params.child,
                  );
          },
        ),
      ),
    );
  }

  double _getMaxHeight() {
    double max = _defaultParams.height;
    if (max < _progressParams.height) {
      max = _progressParams.height;
    }
    if (max < _successParams.height) {
      max = _successParams.height;
    }
    if (max < _errorParams.height) {
      max = _errorParams.height;
    }
    return max;
  }

  AnyAnimatedButtonParams _getParamsFromState(final AnyAnimatedButtonState state) {
    if (state is DefaultAnyAnimatedButtonState) {
      return widget.defaultButtonParams.copyWith(width: _defaultParams.width);
    } else if (state is ProgressAnyAnimatedButtonState) {
      return _progressParams;
    } else if (state is SuccessAnyAnimatedButtonState) {
      return _successParams;
    } else {
      return _errorParams;
    }
  }
}
