import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesItem extends StatelessWidget {
  final String svg, title;
  final VoidCallback? onTap;

  const ServicesItem({
    super.key,
    required this.svg,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              SvgAssets.bkashLogo,
              width: 28,
              height: 28,
              color: ThemeColors.primary,
              fit: BoxFit.contain,
              placeholderBuilder: (context) =>
                  const CircularProgressIndicator(strokeWidth: 2),
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image),
            ),
          ),

          const SizedBox(height: 6),

          TextWidgetSwitcher(
            title,
            boxHeight: 22,

            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
