import 'package:adoption_app/features/cats/injection_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:form_validator/form_validator.dart';
import 'package:adoption_app/app_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fimber/fimber.dart';

final sl = GetIt.instance;

const globalDio = 'global';

class InjectionContainer extends Injector with CatsInjector {}

ValidationBuilder get validator => sl<ValidationBuilder>(param1: false);

ValidationBuilder get optionalFieldValidator =>
    sl<ValidationBuilder>(param1: true);

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    await Hive.initFlutter();

    sl.registerFactoryParam((final bool param1, final _) =>
        ValidationBuilder(localeName: 'pl', optional: param1));

    sl.registerLazySingleton<AppConfig>(() => AppConfig.init);
    sl.registerLazySingleton<Dio>(
      () {
        final dio = Dio(BaseOptions(
          baseUrl: sl<AppConfig>().api,
          connectTimeout: 15000,
          receiveTimeout: 15000,
        ));
        dio
          ..options.headers = {
            "content-type": "application/json",
            "Accept": "application/json",
            "x-api-key": "d604791c-7c62-4fb4-9c00-e0f73a9ea7f0",
          };
        if (!sl<AppConfig>().silenceLogs) {
          dio.interceptors.add(
            PrettyDioLogger(
              requestBody: true,
              requestHeader: true,
              responseHeader: true,
              shortenBase64String: true,
              logPrint: (final object) => Fimber.d(object.toString()),
            ),
          );
        }
        return dio;
      },
      instanceName: globalDio,
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }
}
