// ignore_for_file: camel_case_types

import 'package:bkashclone/core/key/app_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale locale = Locale("bn");
  int index = 1;
  void init() async {
    final preferences = await SharedPreferences.getInstance();
    final data = preferences.getInt(AppKey.language);
    if (data != null) {
      if (data == 0) {
        locale = Locale("en");
        index = 0;
        notifyListeners();
      } else if (data == 1) {
        locale = Locale("bn");
        index = 1;
        notifyListeners();
      } else {
        locale = Locale("bn");
        index = 1;
        notifyListeners();
      }
    } else {
      locale = Locale("bn");
      preferences.setInt(AppKey.language, 1);
      index = 1;
      notifyListeners();
    }
  }

  void languageChange(int index1) async {
    if (index1 == 0) {
      locale = Locale("en");
    }
    if (index1 == 1) {
      locale = Locale("bn");
    }
    index = index1;
    notifyListeners();
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt(AppKey.language, index1);
  }
}
