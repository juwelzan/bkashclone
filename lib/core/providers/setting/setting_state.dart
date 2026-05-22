// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingState {
  ThemeMode themeMode;
  Locale locale;
  ScreenView screenView;
  SettingState({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale("bn"),
    this.screenView = .onboarding,
  });

  SettingState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    ScreenView? screenView,
  }) {
    return SettingState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      screenView: screenView ?? this.screenView,
    );
  }
}

enum ScreenView { onboarding, home }
