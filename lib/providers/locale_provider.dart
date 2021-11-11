import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localization/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;
  void setLocale(Locale locale) async {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedLocale',
          json.encode({'languageCode': _locale == null ? 'us' : _locale!.languageCode}));
    } catch (error) {
      rethrow;
    }
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
