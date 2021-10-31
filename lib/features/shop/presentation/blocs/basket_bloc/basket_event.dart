part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class AddBasketProductEvent extends BasketEvent {
  const AddBasketProductEvent({required this.product});

  final Product product;

  @override
  List<Object> get props => [product];
}

class SubtractBasketProductEvent extends BasketEvent {
  const SubtractBasketProductEvent({required this.product});

  final Product product;

  @override
  List<Object> get props => [product];
}

class RemoveBasketProductEvent extends BasketEvent {
  const RemoveBasketProductEvent({required this.product});

  final Product product;

  @override
  List<Object> get props => [product];
}
