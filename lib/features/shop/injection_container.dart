import 'package:aplikacja_sklep/features/shop/data/data_sources/data_source.dart';
import 'package:aplikacja_sklep/features/shop/data/repositories/repository_impl.dart';
import 'package:aplikacja_sklep/features/shop/domain/repositories/repository.dart';
import 'package:aplikacja_sklep/features/shop/domain/use_cases/fetch_products_use_case.dart';
import 'package:aplikacja_sklep/features/shop/presentation/blocs/basket_bloc/basket_bloc.dart';
import 'package:aplikacja_sklep/features/shop/presentation/blocs/fetch_products_bloc/fetch_products_bloc.dart';
import 'package:aplikacja_sklep/injection_container.dart';

mixin ShopInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    // blocs
    sl.registerFactory(() => FetchProductsBloc(fetchProductsUseCase: sl()));
    sl.registerFactory(() => BasketBloc());

    // use cases
    sl.registerLazySingleton(() => FetchProductsUseCase(repository: sl()));

    // repositories
    sl.registerLazySingleton<Repository>(() => RepositoryImpl(dataSource: sl()));

    // data sources
    sl.registerLazySingleton<DataSource>(() => DataSourceImpl());
  }
}
