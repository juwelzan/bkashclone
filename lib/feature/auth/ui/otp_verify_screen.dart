import 'package:bkashclone/core/assets/png_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/feature/auth/provider/auth_provider.dart';
import 'package:bkashclone/feature/auth/ui/password_screen.dart';
import 'package:bkashclone/feature/auth/widget/bkash_logo.dart';
import 'package:bkashclone/feature/auth/widget/bottom_button.dart';
import 'package:bkashclone/feature/auth/widget/row_text.dart';
import 'package:bkashclone/feature/auth/widget/top_buttom.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyScreen extends ConsumerStatefulWidget {
  static const String name = "OtpVerifyScreen";
  static const String path = "/OtpVerifyScreen";

  const OtpVerifyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends ConsumerState<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final stateRef = ref.watch(authProviderProvider);
    controller.text = stateRef.otp;
    final stateFun = ref.watch(authProviderProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                children: [
                  TopButton(),
                  const SizedBox(height: 40),
                  BkashLogo(),
                  const SizedBox(height: 10),
                  RowText(
                    l10n.verify,
                    style: TextStyle(fontSize: 17, fontWeight: .w500),
                  ),
                  const SizedBox(height: 10),
                  RowText(
                    l10n.your_mobile_number,
                    style: TextStyle(fontSize: 17, fontWeight: .w500),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      RowText(
                        l10n.verification,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: .w500,
                          color: Colors.grey[700],
                        ),
                      ),
                      TextWidgetSwitcher(
                        l10n.resend_otp,
                        style: TextStyle(
                          fontSize: 13,
                          color: ThemeColors.primary,
                          fontWeight: .w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Pinput(
                    defaultPinTheme: PinTheme(
                      height: 50,
                      width: 50,
                      textStyle: TextStyle(fontSize: 24, fontWeight: .bold),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      constraints: BoxConstraints(minHeight: 60, minWidth: 60),
                    ),
                    length: 6,
                    keyboardType: .none,
                    isCursorAnimationEnabled: false,
                    showCursor: false,
                    controller: controller,
                    onChanged: (value) {
                      if (value.length == 6) {
                        Future(() => stateFun.isOtpValidUpdate(true));
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  RowText(
                    l10n.verification_code_sent,
                    style: TextStyle(fontSize: 15),
                  ),

                  Row(
                    mainAxisAlignment: .start,
                    children: [
                      RowText(
                        "+88${stateRef.number}",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextWidgetSwitcher(
                        " (${l10n.change})",
                        style: TextStyle(
                          fontSize: 15,
                          color: ThemeColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black38, blurRadius: 10),
                      ],
                      image: DecorationImage(
                        fit: .fill,
                        image: AssetImage(PngAssets.otpNotShare),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: .end,
                children: [
                  BottomButton(
                    isEnabled: stateRef.isOtpValid,
                    onTap: () {
                      context.push(PasswordScreen.path);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final controller = TextEditingController();
  @override
  void initState() {
    Future(() {
      ref.read(authProviderProvider.notifier).autoOtoField();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  PinTheme defaultTheme = PinTheme(
    height: 50,
    width: 50,
    textStyle: TextStyle(fontSize: 20),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(color: Colors.grey[300]),
    constraints: BoxConstraints(minHeight: 50, minWidth: 50),
  );
}
