import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/bkash_button.dart';
import 'package:bkashclone/shared/widgets/show_custom_snack_bar.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';

class BottomUserLoginBar extends StatelessWidget {
  const BottomUserLoginBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: ThemeColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            TextWidgetSwitcher(
              context.l10n.greatservicesawait,
              style: TextStyle(
                fontSize: 19,
                fontWeight: .w500,
                color: ThemeColors.surface,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: BkashButton(
                onTap: () {
                  // context.push(PhoneNumberSetScreen.path);
                  ShowCustomSnackBar.top(context);
                },
                width: double.infinity,
                color: ThemeColors.surface,
                height: 50,
                child: TextWidgetSwitcher(
                  context.l10n.login,

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w400,
                    color: ThemeColors.primary,
                  ),
                ),
              ),
            ),
            TextWidgetSwitcher(
              context.l10n.changebKashnumber,
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w400,
                color: ThemeColors.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
