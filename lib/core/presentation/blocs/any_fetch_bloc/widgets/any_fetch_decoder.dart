import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplikacja_sklep/core/presentation/blocs/any_fetch_bloc/any_fetch_bloc.dart';
import 'package:aplikacja_sklep/core/presentation/widgets/default_error_widget.dart';

class AnyFetchDecoder<T> extends StatelessWidget {
  const AnyFetchDecoder({
    required final this.anyFetchBloc,
    required final this.dataBuilder,
    final this.loadingBuilder,
    final this.errorBuilder,
    final Key? key,
  }) : super(key: key);

  final AnyFetchBloc<T> anyFetchBloc;
  final Widget Function(BuildContext, DataAnyFetchState<T>) dataBuilder;
  final Widget Function(BuildContext, LoadingAnyFetchState)? loadingBuilder;
  final Widget Function(BuildContext, ErrorAnyFetchState)? errorBuilder;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder(
      bloc: anyFetchBloc,
      builder: (final context, final state) {
        if (state is DataAnyFetchState<T>) {
          return dataBuilder(context, state);
        } else if (state is LoadingAnyFetchState) {
          return loadingBuilder?.call(context, state) ??
              const Center(
                child: CircularProgressIndicator(),
              );
        } else if (state is ErrorAnyFetchState) {
          return errorBuilder?.call(context, state) ??
              DefaultErrorWidget(
                onRefresh: () {
                  anyFetchBloc.add(const DefaultAnyFetchEvent());
                },
              );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
