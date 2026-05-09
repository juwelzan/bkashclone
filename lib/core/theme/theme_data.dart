import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemesData {
  ThemesData._();
  static ThemeData light = ThemeData(
    primaryColor: ThemeColors.primary,
    scaffoldBackgroundColor: ThemeColors.surface,
    appBarTheme: const AppBarTheme(backgroundColor: ThemeColors.primary),
  );
}

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
}
