import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhoneNumberSetScreen extends ConsumerWidget {
  static const String name = "PhoneNumberSetScreen";
  static const String path = "/PhoneNumberSetScreen";

  const PhoneNumberSetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        systemNavigationBarColor: ThemeColors.primary,
        systemNavigationBarDividerColor: Colors.transparent,

        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(),
    );
  }
}
