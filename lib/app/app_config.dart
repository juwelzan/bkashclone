import 'package:bkashclone/app/router/app_route.dart';
import 'package:bkashclone/core/theme/theme_data.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp.router(
          localizationsDelegates: L10n.delegate,
          supportedLocales: L10n.locale,
          locale: Locale("en"),

          debugShowCheckedModeBanner: false,
          theme: ThemesData.light,
          title: "Bkash",
          routerConfig: router,
        );
      },
    );
  }
}
