import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/feature/auth/widget/bkash_logo.dart';
import 'package:bkashclone/feature/auth/widget/row_text.dart';
import 'package:bkashclone/feature/auth/widget/top_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  static const String name = "PasswordScreen";
  static const String path = "/PasswordScreen";
  const PasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                TopButton(),
                const SizedBox(height: 20),
                const BkashLogo(),
                const SizedBox(height: 20),
                RowText(""),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
