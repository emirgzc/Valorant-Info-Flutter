import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum Language { tr, en, ar }

class LanguageProvider with ChangeNotifier {
  static Locale locales = const Locale('tr');
  Locale get locale => locales;

  changeLanguage(BuildContext context, Language language) async {
    switch (language) {
      case Language.tr:
        locales = const Locale('tr');
        await context.setLocale(locales);
        notifyListeners();
        Future.delayed(const Duration(seconds: 1)).then((value) {
          notifyListeners();
        });
        break;
      case Language.en:
        locales = const Locale('en');
        await context.setLocale(locales);

        notifyListeners();
        Future.delayed(const Duration(seconds: 1)).then((value) {
          notifyListeners();
        });
        break;
      case Language.ar:
        locales = const Locale('ar');
        await context.setLocale(locales);

        notifyListeners();
        Future.delayed(const Duration(seconds: 1)).then((value) {
          notifyListeners();
        });
        break;
      default:
    }
  }
}
