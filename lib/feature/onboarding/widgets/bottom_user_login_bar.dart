import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/l10n/l10n.dart';
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
            Text(
              context.l10n!.greatservicesawait,
              style: TextStyle(
                fontSize: 20,
                fontWeight: .bold,
                color: ThemeColors.surface,
              ),
            ),
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  context.l10n!.login,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: .w500,
                    color: ThemeColors.primary,
                  ),
                ),
              ),
            ),
            Text(
              context.l10n!.changebKashnumber,
              style: TextStyle(
                fontSize: 18,
                fontWeight: .w500,
                color: ThemeColors.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
