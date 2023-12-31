import 'package:alpersonalcoachingapp/localization/Language/language_en.dart';
import 'package:alpersonalcoachingapp/localization/Language/language_sv.dart';
import 'package:alpersonalcoachingapp/localization/Language/languages.dart';
import 'package:flutter/material.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'sv'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();

      case 'sv':
        return LanguageSv();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
