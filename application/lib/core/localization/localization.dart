import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../caching/caching.dart';

const List<String> _supportedLanguages = ['en', 'ar'];

class Localization {
  Locale? _currentLocale;
  Map<String, dynamic>? _localizedValues;
  VoidCallback? _onLocaleChangedCallback;

  static final Localization instance = Localization._internal();

  factory Localization() {
    return instance;
  }

  Localization._internal();

  Iterable<Locale> supportedLocales() =>
      _supportedLanguages.map((lang) => Locale(lang, ''));

  String text(String key) => _localizedValues?[key] ?? '** $key not found';

  String get currentLanguage => _currentLocale?.languageCode ?? 'en';

  Locale? get currentLocale => _currentLocale;

  Future<void> init([String? language]) async {
    if (_currentLocale == null) {
      await setNewLanguage(language, false);
      log("initialized Successfully", name: "Localization");
    }
  }

  setLanguage(String lang) async =>
      CachingHelper.instance?.writeData(CachingKey.LANGUAGE, lang);

  Future<String?> getLanguage() async =>
      CachingHelper.instance?.readString(CachingKey.LANGUAGE);

  Future<void> setNewLanguage(
      [String? newLanguage, bool saveInPrefs = true]) async {
    String language =
        newLanguage ?? (await getLanguage()) ?? _supportedLanguages[0];
    bool isLogin = true;
    // Ensure the language code is valid
    if (_supportedLanguages.contains(language)) {
      _currentLocale = Locale(language, '');
    } else {
      // Handle the case where the language is not supported
      _currentLocale = Locale(_supportedLanguages[0], '');
    }
    String jsonContent = await rootBundle
        .loadString("assets/langs/${_currentLocale?.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    // show message
    log('the language [${_currentLocale?.languageCode}].',
        name: 'Localization');
    //
    if (saveInPrefs && isLogin) {
      await setLanguage(language);
      // TODO: update the language
    }

    if (_onLocaleChangedCallback != null) {
      _onLocaleChangedCallback!();
    }
  }

  set onLocaleChangedCallback(VoidCallback callback) {
    _onLocaleChangedCallback = callback;
  }
}

Localization localization = Localization.instance;
