import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizations_en.dart' deferred as localizations_en;
import 'localizations_zh.dart' deferred as localizations_zh;

abstract class CustomLocalizations {
  CustomLocalizations(String locale)
      : assert(locale != null),
        localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations);
  }

  static const LocalizationsDelegate<CustomLocalizations> delegate =
      _LocalizationsDelegate();
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  String get light;
  String get dark;
  String get languageEn;
  String get languageZn;
  String get appName;
  String get tabMain;
  String get tabDiscover;
  String get tabAcademy;
  String get tabMe;
  String get signIn;
  String get tabNew;
  String get tabHot;
  String get test;
  String get jump;
  String get refresh;
  String get dialogTitle;
  String get dialogCanncel;
  String get dialogConfirm;
  String get tip;
  String get selected;
}

class _LocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  const _LocalizationsDelegate();

  @override
  Future<CustomLocalizations> load(Locale locale) {
    return _lookupGalleryLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'zh',
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_LocalizationsDelegate old) => false;
}

Future<CustomLocalizations> _lookupGalleryLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en':
      {
//        switch (locale.countryCode) {
        return localizations_en
            .loadLibrary()
            .then((dynamic _) => localizations_en.LocalizationEn());
      }
    case 'zh':
      {
        return localizations_zh
            .loadLibrary()
            .then((dynamic _) => localizations_zh.LocalizationZh());
      }
  }
}
