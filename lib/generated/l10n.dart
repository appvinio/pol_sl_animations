// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `There was an error`
  String get defaultError {
    return Intl.message(
      'There was an error',
      name: 'defaultError',
      desc: '',
      args: [],
    );
  }

  /// `Głośność`
  String get vocalisation {
    return Intl.message(
      'Głośność',
      name: 'vocalisation',
      desc: '',
      args: [],
    );
  }

  /// `Przyjazny dla psów`
  String get dogFriendly {
    return Intl.message(
      'Przyjazny dla psów',
      name: 'dogFriendly',
      desc: '',
      args: [],
    );
  }

  /// `Energia`
  String get energyLevel {
    return Intl.message(
      'Energia',
      name: 'energyLevel',
      desc: '',
      args: [],
    );
  }

  /// `Inteligencja`
  String get intelligence {
    return Intl.message(
      'Inteligencja',
      name: 'intelligence',
      desc: '',
      args: [],
    );
  }

  /// `Linienie`
  String get sheddingLevel {
    return Intl.message(
      'Linienie',
      name: 'sheddingLevel',
      desc: '',
      args: [],
    );
  }

  /// `Wymagania socjalne`
  String get socialNeeds {
    return Intl.message(
      'Wymagania socjalne',
      name: 'socialNeeds',
      desc: '',
      args: [],
    );
  }

  /// `Adaptacja`
  String get adaptability {
    return Intl.message(
      'Adaptacja',
      name: 'adaptability',
      desc: '',
      args: [],
    );
  }

  /// `Szczegóły`
  String get details {
    return Intl.message(
      'Szczegóły',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Tak`
  String get detailsYes {
    return Intl.message(
      'Tak',
      name: 'detailsYes',
      desc: '',
      args: [],
    );
  }

  /// `Nie`
  String get detailsNo {
    return Intl.message(
      'Nie',
      name: 'detailsNo',
      desc: '',
      args: [],
    );
  }

  /// `Bezwłosy`
  String get isHairless {
    return Intl.message(
      'Bezwłosy',
      name: 'isHairless',
      desc: '',
      args: [],
    );
  }

  /// `Naturalny`
  String get isNatural {
    return Intl.message(
      'Naturalny',
      name: 'isNatural',
      desc: '',
      args: [],
    );
  }

  /// `Hipoalergiczny`
  String get isHypoallergenic {
    return Intl.message(
      'Hipoalergiczny',
      name: 'isHypoallergenic',
      desc: '',
      args: [],
    );
  }

  /// `Przystosowany do życia w domu`
  String get isIndoor {
    return Intl.message(
      'Przystosowany do życia w domu',
      name: 'isIndoor',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
