import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/src/core/providers/home_data_provider.dart';
import 'package:mobile_shop/src/utils/enumeration/language.dart';

class PageProvider with ChangeNotifier {
  int _currentPage = 0;
  Language language = Language.english;

  changeCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  int get currentPage => _currentPage;

  String changeLocale(Language language, BuildContext context) {
    String locale = "";
    Map<Language, String> map = {
      Language.english: "en",
      Language.arabic: "ar",
      Language.deutsch: "de"
    };
    locale = map[language] ?? "en";
    context.setLocale(Locale(locale));
    HomeDataProvider();
    notifyListeners();

    return locale;
  }

  changeLanguage(Language value) {
    language = value;
    notifyListeners();
  }
}
