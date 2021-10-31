import 'package:equatable/equatable.dart';

abstract class Product extends Equatable {
  const Product();

  int get id;

  String get name;

  String get description;

  String get url;

  double get price;
}
