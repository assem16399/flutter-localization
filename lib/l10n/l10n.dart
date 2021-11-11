import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale(
      'en',
    ),
    const Locale(
      'fr',
    ),
    const Locale(
      'de',
    ),
    const Locale(
      'ar',
    ),
  ];
  static String getFlag(String langCode) {
    switch (langCode) {
      case 'en':
        return '🇺🇸';
      case 'fr':
        return '🇫🇷';
      case 'de':
        return '🇩🇪';
      case 'ar':
        return '🇪🇬';
      default:
        return '🇺🇸';
    }
  }
}
