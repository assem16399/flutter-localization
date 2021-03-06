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
        return 'πΊπΈ';
      case 'fr':
        return 'π«π·';
      case 'de':
        return 'π©πͺ';
      case 'ar':
        return 'πͺπ¬';
      default:
        return 'πΊπΈ';
    }
  }
}
