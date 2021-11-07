import 'package:enum_to_string/enum_to_string.dart';
import 'package:fimber/fimber.dart';

enum Configs { local, development, production, staging }

abstract class AppConfig {
  const AppConfig._();

  String get apiHostName;

  String get api => 'https://$apiHostName/';

  Configs get config;

  bool get isProduction => config == Configs.production;

  bool get silenceLogs;

  static AppConfig get init => _getForFlavor;

  static AppConfig get _getForFlavor {
    final flavor = EnumToString.fromString(
      Configs.values,
      const String.fromEnvironment('flavor', defaultValue: 'production'),
    );

    const isVerbose = bool.fromEnvironment('verbose');

    if (isVerbose) {
      plantTree();
    }

    switch (flavor) {
      case Configs.local:
        Fimber.d('local mode');
        return const LocalConfig(silenceLogs: !isVerbose);
      case Configs.development:
        Fimber.d('development mode');
        return const DevConfig(silenceLogs: !isVerbose);
      case Configs.staging:
        Fimber.d('staging mode');
        return const StagingConfig(silenceLogs: !isVerbose);
      case Configs.production:
        Fimber.d('production mode');
        return const ProdConfig(silenceLogs: !isVerbose);
      default:
        throw UnimplementedError();
    }
  }

  static void plantTree() {
    Fimber.plantTree(
      CustomFormatTree(
        useColors: true,
        logFormat: "${CustomFormatTree.timeStampToken}: ${CustomFormatTree.messageToken}",
      ),
    );
  }
}

class DevConfig extends AppConfig {
  const DevConfig({required final this.silenceLogs}) : super._();

  @override
  String get apiHostName => 'api.thecatapi.com/v1';

  @override
  final bool silenceLogs;

  @override
  Configs get config => Configs.development;
}

class StagingConfig extends AppConfig {
  const StagingConfig({required final this.silenceLogs}) : super._();

  @override
  String get apiHostName => 'api.thecatapi.com/v1';

  @override
  final bool silenceLogs;

  @override
  Configs get config => Configs.staging;
}

class ProdConfig extends AppConfig {
  const ProdConfig({required final this.silenceLogs}) : super._();

  @override
  String get apiHostName => 'api.thecatapi.com/v1';

  @override
  final bool silenceLogs;

  @override
  Configs get config => Configs.production;
}

class LocalConfig extends AppConfig {
  const LocalConfig({required final this.silenceLogs}) : super._();

  @override
  String get apiHostName => 'api.thecatapi.com/v1';

  @override
  final bool silenceLogs;

  @override
  Configs get config => Configs.local;
}
