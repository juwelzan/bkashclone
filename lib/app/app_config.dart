import 'package:bkashclone/core/provider/language_provider/language_provider.dart';
import 'package:bkashclone/core/theme/theme_data.dart';
import 'package:bkashclone/feature/splash/ui/splash_screen.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Consumer<LanguageProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              localizationsDelegates: L10n.delegate,
              supportedLocales: L10n.locale,
              locale: value.locale,

              debugShowCheckedModeBanner: false,
              theme: ThemesData.light,
              title: "Bkash",
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}
