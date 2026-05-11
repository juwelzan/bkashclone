import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const CategoryTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: .w700)),
            GestureDetector(
              onTap: onTap,
              child: Text(
                "see all",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w700,
                  color: ThemeColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
