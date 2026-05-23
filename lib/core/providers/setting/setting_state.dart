// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingState {
  ThemeMode themeMode;
  String localeCode;
  ScreenView screenView;
  SettingState({
    this.themeMode = ThemeMode.system,
    this.localeCode = "bn",
    this.screenView = .onboarding,
  });

  SettingState copyWith({
    ThemeMode? themeMode,
    String? localeCode,
    ScreenView? screenView,
  }) {
    return SettingState(
      themeMode: themeMode ?? this.themeMode,
      localeCode: localeCode ?? this.localeCode,
      screenView: screenView ?? this.screenView,
    );
  }
}

enum ScreenView { onboarding, home }
