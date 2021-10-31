import 'dart:async';

import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(const BasketDataState(basket: {}));

  final Map<Product, int> _basket = {};

  @override
  Stream<BasketState> mapEventToState(
    BasketEvent event,
  ) async* {
    if (event is AddBasketProductEvent) {
      yield* _mapAddBasketProductEvent(event);
    } else if (event is SubtractBasketProductEvent) {
      yield* _mapSubtractBasketProductEvent(event);
    } else if (event is RemoveBasketProductEvent) {
      yield* _mapRemoveBasketProductEvent(event);
    }
  }

  Stream<BasketState> _mapAddBasketProductEvent(AddBasketProductEvent event) async* {
    final value = _basket.putIfAbsent(event.product, () => 0);
    _basket[event.product] = value + 1;
    yield BasketDataState(basket: Map.from(_basket));
  }

  Stream<BasketState> _mapSubtractBasketProductEvent(SubtractBasketProductEvent event) async* {
    if (_basket.containsKey(event.product)) {
      if (_basket[event.product]! > 1) {
        _basket[event.product] = _basket[event.product]! - 1;
      } else {
        _basket.remove(event.product);
      }
    }
    yield BasketDataState(basket: Map.from(_basket));
  }

  Stream<BasketState> _mapRemoveBasketProductEvent(RemoveBasketProductEvent event) async* {
    _basket.remove(event.product);
    yield BasketDataState(basket: Map.from(_basket));
  }
}
