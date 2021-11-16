import 'package:adoption_app/features/cats/data/data_sources/data_source.dart';
import 'package:adoption_app/features/cats/data/repositories/repository_impl.dart';
import 'package:adoption_app/features/cats/domain/repositories/repository.dart';
import 'package:adoption_app/features/cats/domain/use_cases/adopt_cat_use_case_use_case.dart';
import 'package:adoption_app/features/cats/domain/use_cases/fetch_products_use_case.dart';
import 'package:adoption_app/features/cats/presentation/blocs/adopt_cat/adopt_cat_bloc.dart';
import 'package:adoption_app/features/cats/presentation/blocs/cat_breeds/cat_breeds_bloc.dart';
import 'package:adoption_app/injection_container.dart';

mixin CatsInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    // blocs
    sl.registerFactory(() => CatBreedsBloc(fetchCatBreedsUseCase: sl()));
    sl.registerFactory(() => AdoptCatBloc(adoptCatUseCase: sl()));

    // use cases
    sl.registerLazySingleton(() => FetchCatBreedsUseCase(repository: sl()));
    sl.registerLazySingleton(() => AdoptCatUseCase(repository: sl()));

    // repositories
    sl.registerLazySingleton<Repository>(
        () => RepositoryImpl(dataSource: sl()));

    // data sources
    sl.registerLazySingleton<DataSource>(
        () => DataSourceImpl(source: sl(instanceName: globalDio)));
  }
}
