import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BkashLogo extends StatelessWidget {
  const BkashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          SvgAssets.bkashLogo,
          width: 50,
          height: 50,
          colorFilter: .mode(ThemeColors.primary, .srcIn),
        ),
      ],
    );
  }
}
