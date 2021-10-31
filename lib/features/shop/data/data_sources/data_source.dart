import 'package:aplikacja_sklep/features/shop/data/model/product.dart';
import 'package:aplikacja_sklep/features/shop/domain/entities/product.dart';

abstract class DataSource {
  Future<List<Product>> fetchProducts();
}

class DataSourceImpl extends DataSource {
  static const List<Product> _products = [
    ProductModel(id: 1, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 2, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 3, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 4, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 5, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 6, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 7, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 8, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 9, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 10, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 11, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
    ProductModel(id: 12, description: 'test', name: 'test', price: 0.2, url: 'https://picsum.photos/400'),
  ];

  @override
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 5));
    return _products;
  }
}
