import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onTap;
  const BottomButton({super.key, this.isEnabled = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        clipBehavior: .hardEdge,
        padding: const EdgeInsets.all(10),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isEnabled ? ThemeColors.primary : ThemeColors.secondary,
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
              style: TextStyle(
                fontSize: 17,
                fontWeight: .w600,
                color: ThemeColors.surface,
              ),
            ),
            SvgPicture.asset(
              SvgAssets.arrowRight,
              width: 27,
              height: 27,
              colorFilter: .mode(ThemeColors.surface, .srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
