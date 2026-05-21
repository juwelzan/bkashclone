import 'dart:ui';

import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/bkash_button.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomExpendButton extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onTap;
  const BottomExpendButton({
    super.key,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 100,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: isExpanded
                    ? null
                    : LinearGradient(
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                        colors: [
                          ThemeColors.surface.withOpacity(0.1),

                          ThemeColors.surface,
                        ],
                      ),
              ),
              child: Row(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: BkashButton(
                      width: 120,
                      onTap: onTap,
                      child: Row(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .center,
                        children: [
                          TextWidgetSwitcher(
                            duration: Duration(milliseconds: 800),
                            isExpanded
                                ? context.l10n!.close
                                : context.l10n!.seeMor,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: .w600,
                              color: ThemeColors.primary,
                            ),
                          ),
                          SizedBox(width: 2),
                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 1,
                            duration: Duration(milliseconds: 800),
                            child: SvgPicture.asset(
                              width: 20,
                              key: ValueKey(isExpanded),
                              SvgAssets.arrowDown,
                              color: ThemeColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
