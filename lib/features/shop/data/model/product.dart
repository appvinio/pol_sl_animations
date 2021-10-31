import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required this.id,
    required this.description,
    required this.name,
    required this.price,
    required this.url,
  });

  @override
  final int id;

  @override
  final String description;

  @override
  final String name;

  @override
  final double price;

  @override
  final String url;

  @override
  List<Object?> get props => [
        id,
        description,
        name,
        price,
        url,
      ];
}
