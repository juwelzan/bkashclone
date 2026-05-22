import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DowerListTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const DowerListTile({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(color: ThemeColors.surface),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgAssets.bkashLogo,
              height: 30,
              width: 30,
              color: ThemeColors.primary,
            ),
            SizedBox(width: 30),
            TextWidgetSwitcher(
              title,
              style: TextStyle(fontSize: 17, fontWeight: .w500),
            ),
          ],
        ),
      ),
    );
  }
}
