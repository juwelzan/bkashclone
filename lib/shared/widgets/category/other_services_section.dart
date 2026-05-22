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

class OtherServicesSection extends StatefulWidget {
  const OtherServicesSection({super.key});

  @override
  State<OtherServicesSection> createState() => _OtherServicesSectionState();
}

class _OtherServicesSectionState extends State<OtherServicesSection> {
  ValueNotifier<int> pageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageIndex,
      builder: (context, value, child) {
        return SizedBox(
          height: 350,
          child: Column(
            children: [
              SizedBox(height: 20),
              CategoryTitle(title: context.l10n.otherServices, index: value),
              SizedBox(height: 10),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) => pageIndex.value = value,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _widget(index == 0 ? 12 : 1);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    pageIndex.dispose();
    super.dispose();
  }
}

Widget _widget(int itemCount) {
  return Consumer(
    builder: (context, ref, child) {
      final setting = ref.watch(settingProviderProvider);
      return GridView.builder(
        itemCount: itemCount > 12 ? 12 : itemCount,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 130,
        ),
        itemBuilder: (context, index) {
          return OtherServicesItem(
            onTap: () {
              if (setting.screenView == ScreenView.onboarding) {
                showBottomDower(context);
              }
            },
          );
        },
      );
    },
  );
}

class OtherServicesItem extends StatelessWidget {
  final VoidCallback? onTap;
  const OtherServicesItem({super.key, this.onTap});

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
            "item",
            boxHeight: 22,

            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
