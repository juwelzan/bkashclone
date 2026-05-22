import 'package:bkashclone/core/providers/setting/setting_provider.dart';
import 'package:bkashclone/core/providers/setting/setting_state.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/category/category_title.dart';
import 'package:bkashclone/shared/widgets/show_bottom_dower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfferSection extends ConsumerWidget {
  const OfferSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingProviderProvider);
    return SizedBox(
      height: 260,
      child: Column(
        children: [
          SizedBox(height: 20),
          CategoryTitle(title: context.l10n.offer, onTap: () {}),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: .horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return RepaintBoundary(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OfferItem(
                      onTap: () {
                        if (setting.screenView == ScreenView.onboarding) {
                          showBottomDower(context);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OfferItem extends StatelessWidget {
  final VoidCallback? onTap;
  const OfferItem({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ThemeColors.surface,
          boxShadow: [BoxShadow(color: Colors.grey[500]!, blurRadius: 3)],
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
        ),

        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(5, 5),
                  topRight: Radius.elliptical(5, 5),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/png/offer_banner.png"),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("OfferItem"),
          ],
        ),
      ),
    );
  }
}
