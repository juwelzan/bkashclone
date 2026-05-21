import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesItem extends StatelessWidget {
  const ServicesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,

          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            SvgAssets.bkashLogo,

            color: ThemeColors.primary,
          ),
        ),
        Text(
          "Request Money",
          style: TextStyle(fontSize: 10, fontWeight: .bold),
        ),
      ],
    );
  }
}
