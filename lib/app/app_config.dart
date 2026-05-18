import 'package:bkashclone/app/router/app_route.dart';
import 'package:bkashclone/core/theme/theme_data.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/language_change_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final local = ref.watch(language);
        return MaterialApp.router(
          localizationsDelegates: L10n.delegate,
          supportedLocales: L10n.locale,
          locale: local,

          debugShowCheckedModeBanner: false,
          theme: ThemesData.light,
          title: "Bkash",
          routerConfig: router,
        );
      },
    );
  }
}
