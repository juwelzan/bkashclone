// ignore_for_file: deprecated_member_use

import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/bkash_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BkashServiceContainer extends StatefulWidget {
  const BkashServiceContainer({super.key});

  @override
  State<BkashServiceContainer> createState() => _BkashServiceContainerState();
}

class _BkashServiceContainerState extends State<BkashServiceContainer> {
  ValueNotifier<bool> isExpanded = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isExpanded,
      builder: (context, value, child) {
        return Stack(
          children: [
            AnimatedContainer(
              curve: Curves.easeInOutSine,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
              duration: Duration(milliseconds: 400),
              height: value ? 520 : 320,
              width: double.infinity,
              child: GridView.builder(
                itemCount: 16,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(color: Colors.deepPurpleAccent),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: value
                      ? LinearGradient(
                          begin: AlignmentGeometry.topCenter,
                          end: AlignmentGeometry.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                          ],
                        )
                      : LinearGradient(
                          begin: AlignmentGeometry.topCenter,
                          end: AlignmentGeometry.bottomCenter,
                          colors: [
                            ThemeColors.surface.withOpacity(0.009),
                            ThemeColors.surface.withOpacity(0.6),
                            ThemeColors.surface.withOpacity(0.9),
                            ThemeColors.surface,

                            ThemeColors.surface,
                          ],
                        ),
                ),
                child: Row(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      child: BkashButton(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .center,
                          children: [
                            Text(
                              key: ValueKey(value),
                              value
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
                              turns: value ? 0.5 : 1,
                              duration: Duration(milliseconds: 400),
                              child: SvgPicture.asset(
                                width: 20,
                                key: ValueKey(value),
                                value
                                    ? SvgAssets.arrowDown
                                    : SvgAssets.arrowDown,
                                color: ThemeColors.primary,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          isExpanded.value = !isExpanded.value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
