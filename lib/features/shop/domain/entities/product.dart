import 'package:equatable/equatable.dart';

abstract class Product extends Equatable {
  const Product();

  String get name;

  String get description;

  String get url;

  double get price;
}
