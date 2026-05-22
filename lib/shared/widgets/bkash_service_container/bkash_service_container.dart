// ignore_for_file: deprecated_member_use

import 'package:bkashclone/core/providers/setting/setting_provider.dart';
import 'package:bkashclone/core/providers/setting/setting_state.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/shared/widgets/bkash_service_container/bkash_service_item.dart';
import 'package:bkashclone/shared/widgets/bkash_service_container/bottom_expend_button.dart';
import 'package:bkashclone/shared/widgets/bkash_service_container/model/bkash_service_model.dart';
import 'package:bkashclone/shared/widgets/show_bottom_dower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final _expendProvider = StateProvider<bool>((ref) => false);

class BkashServiceContainer extends ConsumerWidget {
  const BkashServiceContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(_expendProvider);
    final setting = ref.watch(settingProviderProvider);

    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.easeInOutSine,
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: ThemeColors.surface),
            borderRadius: BorderRadius.circular(20),
          ),
          duration: const Duration(milliseconds: 800),
          height: isExpanded ? 522 : 220,
          width: double.infinity,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: ServicesData.list(context).length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,

              mainAxisExtent: 105,
            ),
            itemBuilder: (context, index) {
              final data = ServicesData.list(context);

              return Padding(
                padding: EdgeInsets.all(8.0),
                child: RepaintBoundary(
                  child: ServicesItem(
                    svg: data[index].svg,
                    title: data[index].title,
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

        BottomExpendButton(
          isExpanded: isExpanded,
          onTap: () {
            ref.read(_expendProvider.notifier).state = !ref.read(
              _expendProvider,
            );
          },
        ),
      ],
    );
  }
}
