import 'package:aplikacja_sklep/features/shop/data/model/product.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';

abstract class DataSource {
  Future<List<Product>> fetchProducts();
}

class DataSourceImpl extends DataSource {
  static const List<Product> _products = [
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
    ProductModel(description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/300/300'),
  ];

  @override
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _products;
  }
}
