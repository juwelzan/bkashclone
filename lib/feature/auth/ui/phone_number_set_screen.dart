import 'package:bkashclone/core/assets/png_assets.dart';
import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/feature/auth/provider/auth_provider.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/language_change_button.dart';
import 'package:bkashclone/shared/widgets/show_custom_snack_bar.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PhoneNumberSetScreen extends ConsumerStatefulWidget {
  static const String name = "PhoneNumberSetScreen";
  static const String path = "/PhoneNumberSetScreen";
  const PhoneNumberSetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhoneNumberSetScreenState();
}

class _PhoneNumberSetScreenState extends ConsumerState<PhoneNumberSetScreen> {
  @override
  Widget build(BuildContext context) {
    final stateRef = ref.watch(authProviderProvider);
    final stateFun = ref.watch(authProviderProvider.notifier);
    final l10n = context.l10n;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: .light,

        systemNavigationBarColor: ThemeColors.surface,
        systemNavigationBarDividerColor: Colors.transparent,

        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: SvgPicture.asset(
                            SvgAssets.arrowBack,
                            width: 30,
                            height: 30,
                            colorFilter: .mode(ThemeColors.primary, .srcATop),
                          ),
                        ),
                        LanguageChangeButton(),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.bkashLogo,
                          width: 50,
                          height: 50,
                          colorFilter: .mode(ThemeColors.primary, .srcIn),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        TextWidgetSwitcher(
                          l10n.enter_mobile_number,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: .w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        TextWidgetSwitcher(
                          l10n.login,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 24,
                            fontWeight: .w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          l10n.country_code,
                          style: TextStyle(fontSize: 15, fontWeight: .w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Container(
                      padding: EdgeInsets.all(3),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.elliptical(3, 3)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          Image.asset(
                            PngAssets.bangladesh,
                            width: 30,
                            height: 30,
                            cacheHeight: 40,
                            cacheWidth: 40,
                          ),
                          SizedBox(width: 10),
                          TextWidgetSwitcher(
                            l10n.bangladesh,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: .w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        TextWidgetSwitcher(
                          l10n.mobile_number,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _textField(
                      controller: textController,
                      key: textKey,
                      onChanged: (value) {
                        if (stateFun.isValid01Number(value)) {
                          textController.clear();
                          ShowCustomSnackBar.top(
                            context,
                            message: l10n.enter_number_starting_with,
                          );
                        }

                        if (!stateFun.isValidCheckLength(value)) {
                          stateFun.isNumberValidUpdate(true);
                        }
                        if (stateFun.isValidCheckLength(value)) {
                          stateFun.isNumberValidUpdate(false);
                        }
                      },
                    ),
                    Row(
                      children: [
                        TextWidgetSwitcher(
                          "${l10n.terms_and_conditions_agreement} !",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: .end,
                  children: [
                    Container(
                      clipBehavior: .hardEdge,
                      padding: const EdgeInsets.all(10),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: stateRef.isNumberValid
                            ? ThemeColors.primary
                            : ThemeColors.secondary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(10, 10),
                          topLeft: Radius.elliptical(10, 10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        crossAxisAlignment: .center,
                        children: [
                          TextWidgetSwitcher(
                            l10n.next,
                            style: TextStyle(fontSize: 17, fontWeight: .w600),
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(
                              SvgAssets.arrowRight,
                              width: 27,
                              height: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final textController = TextEditingController();
  final textKey = GlobalKey<FormState>();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}

Widget _textField({
  Key? key,
  TextEditingController? controller,
  Function(String value)? onChanged,
  String? Function(String? value)? validator,
}) {
  return Form(
    key: key,

    child: Column(
      children: [
        Row(
          children: [
            const Text(
              "+88",
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w500,
                color: ThemeColors.text,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                maxLength: 11,
                cursorColor: ThemeColors.primary,
                cursorWidth: 4,
                cursorHeight: 24,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                validator: validator,
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

                  hintText: "01XXXXXXXXX",
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    ),
  );
}
