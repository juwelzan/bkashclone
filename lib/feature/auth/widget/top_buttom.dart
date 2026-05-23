import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/shared/widgets/language_change_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
