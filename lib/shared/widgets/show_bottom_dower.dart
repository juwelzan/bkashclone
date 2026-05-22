import 'package:bkashclone/core/assets/png_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/feature/auth/ui/phone_number_set_screen.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/bkash_button.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showBottomDower(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 350,
        width: double.infinity,

        decoration: BoxDecoration(
          color: ThemeColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: .cover,
                  image: AssetImage(PngAssets.banner),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    context.l10n.greatservicesawait,
                    style: TextStyle(
                      fontSize: 16,
                      color: ThemeColors.text,
                      fontWeight: .w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "  >  ${context.l10n.login_or_registration}",
                      style: TextStyle(
                        fontSize: 14,
                        color: ThemeColors.secondary,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  BkashButton(
                    onTap: () {
                      context.push(PhoneNumberSetScreen.path);
                    },
                    width: double.infinity,
                    color: ThemeColors.primary,
                    height: 50,
                    child: TextWidgetSwitcher(
                      context.l10n.login,

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w400,
                        color: ThemeColors.surface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
