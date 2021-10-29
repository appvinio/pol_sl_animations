import 'package:dartz/dartz.dart';
import 'package:aplikacja_sklep/core/error/failures.dart';

typedef Json = Map<String, dynamic>;
typedef FutureFailable<T> = Future<Either<Failure, T>>;