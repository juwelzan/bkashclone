import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/feature/auth/provider/auth_provider.dart';
import 'package:bkashclone/feature/auth/widget/bkash_logo.dart';
import 'package:bkashclone/feature/auth/widget/row_text.dart';
import 'package:bkashclone/feature/auth/widget/top_buttom.dart';
import 'package:bkashclone/l10n/l10n.dart';
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
    final l10n = context.l10n;
    final stateRef = ref.watch(authProviderProvider);
    final stateFun = ref.watch(authProviderProvider.notifier);
    final loginToAccount = l10n.login_to_bkash_account.split("|");
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
                RowText(loginToAccount[0]),
                RowText(loginToAccount[1]),
                RowText(l10n.account_number),
                RowText("+88 ${stateRef.number}"),
                RowText(l10n.bkash_pin),
                TextField(
                  decoration: InputDecoration(helperText: l10n.enter_bkash_pin),
                ),
                RowText("${l10n.forgot_pin} ${l10n.pin_reset}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
