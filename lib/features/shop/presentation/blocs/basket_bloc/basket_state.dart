part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  Map<Product, int> get basket;

  @override
  List<Object> get props => [];
}

class BasketDataState extends BasketState {
  const BasketDataState({required this.basket});

  @override
  final Map<Product, int> basket;

  @override
  List<Object> get props => [basket];
}
