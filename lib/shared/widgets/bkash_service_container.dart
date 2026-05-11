// ignore_for_file: deprecated_member_use

import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

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
                    ElevatedButton(
                      onPressed: () {
                        isExpanded.value = !isExpanded.value;
                      },
                      child: Text("see mor"),
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
