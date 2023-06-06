import 'package:flutter/material.dart';

enum LanguageCodes {
  tr,
  en,
}

extension LanguageCodeExtension on LanguageCodes {
  String _name() {
    switch (this) {
      case LanguageCodes.tr:
        return 'tr-Tr';
      case LanguageCodes.en:
        return 'en-US';
    }
  }

  String get nameGet => _name();
}

extension IconPathExtension on String {
  String get iconPath => 'assets/icons/$this.svg';
}

extension LogoPathExtension on String {
  String get logoPath => 'assets/logo/$this.svg';
}

extension LottiePathExtension on String {
  String get lottiePath => 'assets/lottie/$this.json';
}

extension TextThemeExtension on BuildContext {
  TextTheme get theme => Theme.of(this).textTheme;
}

String switchLanguage(Locale locale) {
  return locale.languageCode == LanguageCodes.tr.name
      ? 'tr-TR'
      : locale.languageCode == LanguageCodes.en.name
          ? 'en-US'
          : 'ar-AE';
}
