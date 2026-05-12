// ignore_for_file: deprecated_member_use

import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class BkashButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final Widget? child;
  final double? height, width;
  const BkashButton({
    super.key,
    this.onTap,
    this.color,
    this.child,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2),
        height: height ?? 40,
        width: width ?? 100,
        decoration: BoxDecoration(
          color: color ?? ThemeColors.surface,
          boxShadow: [
            BoxShadow(color: Colors.black12.withOpacity(0.1), blurRadius: 5),
          ],
          border: Border.all(
            width: 0.3,
            color: ThemeColors.secondary.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.all(Radius.elliptical(7, 7)),
        ),
        child: child,
      ),
    );
  }
}
