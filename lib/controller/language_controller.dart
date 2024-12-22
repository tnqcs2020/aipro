import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController with ChangeNotifier {
  Locale? _apLocale;
  Locale? get appLocale => _apLocale;

  void loadLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? languageCode = sp.getString('language_code');
    if (languageCode != null) {
      _apLocale = Locale(languageCode);
    } else {
      _apLocale = const Locale('vi');
    }
    notifyListeners();
  }

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _apLocale = type;
    await sp.setString('language_code', type.languageCode);
    notifyListeners();
  }
}
