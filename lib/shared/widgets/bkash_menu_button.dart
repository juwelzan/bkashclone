// ignore_for_file: deprecated_member_use

import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BkashMenuButton extends StatelessWidget {
  final VoidCallback? onTap;
  const BkashMenuButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 40,
          left: 0,
          right: 20,
          child: Row(
            mainAxisAlignment: .end,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: ThemeColors.surface,
                    border: Border.all(
                      width: 0.8,
                      color: ThemeColors.secondary.withOpacity(0.5),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    SvgAssets.bkashLogo,
                    colorFilter: ColorFilter.mode(ThemeColors.primary, .srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 73,
          left: 0,
          right: 25,
          child: Row(
            mainAxisAlignment: .end,
            children: [
              Container(
                height: 18,
                width: 18,
                padding: EdgeInsets.all(3.5),
                decoration: BoxDecoration(
                  color: ThemeColors.surface,
                  border: Border.all(
                    width: 0.8,
                    color: ThemeColors.secondary.withOpacity(0.5),
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(SvgAssets.menu, width: 10, height: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
