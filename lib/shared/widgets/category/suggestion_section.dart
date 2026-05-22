// ignore_for_file: file_names

import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/providers/setting/setting_provider.dart';
import 'package:bkashclone/core/providers/setting/setting_state.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/category/category_title.dart';
import 'package:bkashclone/shared/widgets/show_bottom_dower.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SuggestionSection extends ConsumerWidget {
  const SuggestionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingProviderProvider);
    return SizedBox(
      height: 160,
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(2),
            child: CategoryTitle(title: context.l10n.suggestion, onTap: () {}),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: .horizontal,
              itemBuilder: (context, index) {
                return RepaintBoundary(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SuggestionItem(
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

class SuggestionItem extends StatelessWidget {
  final VoidCallback? onTap;
  const SuggestionItem({super.key, this.onTap});

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
            "Item",
            boxHeight: 22,

            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
