import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/feature/auth/provider/auth_provider.dart';
import 'package:bkashclone/feature/auth/widget/bkash_logo.dart';
import 'package:bkashclone/feature/auth/widget/bottom_button.dart';
import 'package:bkashclone/feature/auth/widget/row_text.dart';
import 'package:bkashclone/feature/auth/widget/top_buttom.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TopButton(),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      const BkashLogo(),
                      SvgPicture.asset(
                        SvgAssets.qrCode,
                        height: 40,
                        width: 40,
                        colorFilter: .mode(ThemeColors.primary, .srcIn),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RowText(
                    loginToAccount[0],
                    style: TextStyle(fontSize: 20, fontWeight: .w500),
                  ),
                  RowText(
                    loginToAccount[1],
                    style: TextStyle(fontSize: 20, fontWeight: .w500),
                  ),
                  const SizedBox(height: 30),
                  RowText(
                    l10n.account_number,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: .w400,
                      color: ThemeColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  RowText(
                    "+88 ${stateRef.number}",
                    style: TextStyle(fontSize: 18, fontWeight: .w500),
                  ),
                  const Divider(),
                  const SizedBox(height: 20),
                  RowText(
                    l10n.bkash_pin,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  _textField(
                    hintText: l10n.enter_bkash_pin,

                    onChanged: (value) {
                      if (value.length == 5) {
                        stateFun.isPasswordValidUpdate(true);
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  RowText(
                    "${l10n.forgot_pin} ${l10n.pin_reset}",
                    style: TextStyle(fontSize: 15, color: ThemeColors.primary),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: .end,
                children: [BottomButton(isEnabled: stateRef.isPasswordValid)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _textField({
  Key? key,
  TextEditingController? controller,
  Function(String value)? onChanged,
  String? hintText,

  FocusNode? focusNode,
  VoidCallback? onTap,
}) {
  return Form(
    key: key,

    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                obscureText: true,
                autofocus: true,
                focusNode: focusNode,
                maxLength: 5,
                cursorColor: ThemeColors.primary,
                cursorWidth: 4,
                cursorHeight: 24,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: .w500,
                  color: ThemeColors.text,
                ),
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  counterText: "",
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),

                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(
                SvgAssets.fingerprint,
                width: 30,
                height: 30,
                colorFilter: .mode(ThemeColors.primary, .srcIn),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    ),
  );
}
