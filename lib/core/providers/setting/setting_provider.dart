import 'package:bkashclone/core/key/app_key.dart';
import 'package:bkashclone/core/providers/setting/setting_state.dart';
import 'package:bkashclone/core/providers/shared/provider_di/provider_dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_provider.g.dart';

@riverpod
class SettingProvider extends _$SettingProvider {
  @override
  SettingState build() {
    checkIn();
    return SettingState();
  }

  void localeChange(String code) {
    state = state.copyWith(locale: Locale(code.trim()));
    _sharedUpdate(local: code.trim());
  }

  void themeChange(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
    _sharedUpdate(theme: themeMode.toString());
  }

  Future<void> checkIn() async {
    debugPrint("checkIn called");
    final shared = await sharedPreferences(ref);

    final local = shared.getString(AppKey.language);
    final theme = shared.getString(AppKey.themeMode);
    if (local != null) {
      state = state.copyWith(locale: Locale(local));
    } else {
      shared.setString(AppKey.language, "bn");
    }
    if (theme != null) {
      state = state.copyWith(themeMode: __themeMode(theme));
    } else {
      shared.setString(AppKey.language, ThemeMode.system.toString());
    }
  }

  Future<void> _sharedUpdate({String? theme, String? local}) async {
    final shared = await sharedPreferences(ref);
    if (theme != null) {
      shared.setString(AppKey.themeMode, theme);
    }
    if (local != null) {
      shared.setString(AppKey.language, local);
    }
  }

  ThemeMode __themeMode(String theme) {
    if (ThemeMode.dark.toString() == theme) {
      return .dark;
    } else if (ThemeMode.light.toString() == theme) {
      return .light;
    } else {
      return .system;
    }
  }

  void screenViewUpdate(ScreenView screenView) {
    state = state.copyWith(screenView: screenView);
  }
}
