import 'package:aplikacja_sklep/features/cats/data/data_sources/data_source.dart';
import 'package:aplikacja_sklep/features/cats/data/repositories/repository_impl.dart';
import 'package:aplikacja_sklep/features/cats/domain/repositories/repository.dart';
import 'package:aplikacja_sklep/features/cats/domain/use_cases/fetch_products_use_case.dart';
import 'package:aplikacja_sklep/features/cats/presentation/blocs/cat_breeds/cat_breeds_bloc.dart';
import 'package:aplikacja_sklep/injection_container.dart';

mixin CatsInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    // blocs
    sl.registerFactory(() => CatBreedsBloc(fetchCatBreedsUseCase: sl()));

    // use cases
    sl.registerLazySingleton(() => FetchCatBreedsUseCase(repository: sl()));

    // repositories
    sl.registerLazySingleton<Repository>(
        () => RepositoryImpl(dataSource: sl()));

    // data sources
    sl.registerLazySingleton<DataSource>(
        () => DataSourceImpl(source: sl(instanceName: globalDio)));
  }
}
