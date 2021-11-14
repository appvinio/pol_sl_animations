import 'package:aplikacja_sklep/core/style/colors.dart';
import 'package:aplikacja_sklep/features/cats/presentation/screens/cats_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:aplikacja_sklep/injection_container.dart';
import 'package:aplikacja_sklep/core/navigator/navigator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:aplikacja_sklep/generated/l10n.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomNavigator.router.generator,
      navigatorKey: CustomNavigator.navigatorKey,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Sklep Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: CustomColors.primary,
        hintColor: CustomColors.hint,
        colorScheme: const ColorScheme(
          primary: CustomColors.primary,
          primaryVariant: CustomColors.primary,
          secondary: CustomColors.primary,
          secondaryVariant: CustomColors.secondary,
          surface: CustomColors.hint,
          background: CustomColors.background,
          error: CustomColors.redColor,
          onPrimary: CustomColors.primary,
          onSecondary: CustomColors.secondary,
          onSurface: CustomColors.primary,
          onBackground: CustomColors.primary,
          onError: CustomColors.redColor,
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: BotToastInit(),
      home: const CatsScreen(),
    );
  }
}
