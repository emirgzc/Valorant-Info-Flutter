import 'package:flutter/material.dart';

enum LanguageCodes {
  tr,
  en,
}

extension TextThemeExtension on BuildContext {
  TextTheme get theme => Theme.of(this).textTheme;
}

String switchLanguage(Locale locale) {
  return locale.languageCode == LanguageCodes.tr.name ? 'tr-TR' : 'en-US';
}
