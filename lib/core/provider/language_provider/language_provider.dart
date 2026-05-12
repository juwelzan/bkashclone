import 'package:bkashclone/core/key/app_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale locale = const Locale("bn");
  int index = 1;

  Future<void> init() async {
    final preferences = await SharedPreferences.getInstance();
    final data = preferences.getInt(AppKey.language);

    if (data == 0) {
      _setLanguage("en", 0);
    } else {
      _setLanguage("bn", 1);
      await preferences.setInt(AppKey.language, 1);
    }

    notifyListeners();
  }

  void languageChange(int newIndex) async {
    if (newIndex == 0) {
      _setLanguage("en", 0);
    } else {
      _setLanguage("bn", 1);
    }

    notifyListeners();

    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(AppKey.language, newIndex);
  }

  void _setLanguage(String code, int i) {
    locale = Locale(code);
    index = i;
  }
}
