import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final int? index;
  const CategoryTitle({super.key, required this.title, this.onTap, this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                TextWidgetSwitcher(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: .w700),
                ),
              ],
            ),
            if (index == null)
              GestureDetector(
                onTap: onTap,
                child: onTap != null
                    ? TextWidgetSwitcher(
                        context.l10n.seeAll,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w700,
                          color: ThemeColors.primary,
                        ),
                      )
                    : SizedBox(),
              ),

            if (index != null)
              SizedBox(
                width: 50,

                child: Row(
                  mainAxisAlignment: .end,
                  children: List.generate(2, (inde) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        shape: .circle,
                        color: inde == index
                            ? ThemeColors.primary
                            : ThemeColors.secondary,
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
