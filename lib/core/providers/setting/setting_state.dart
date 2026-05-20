// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingState {
  ThemeMode themeMode;
  Locale locale;
  SettingState({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale("bn"),
  });

  SettingState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return SettingState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
