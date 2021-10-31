import 'package:aplikacja_sklep/features/shop/presentation/screens/shop_screen.dart';
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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: BotToastInit(),
      home: const ShopScreen(),
    );
  }
}
