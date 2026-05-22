import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/providers/setting/setting_provider.dart';
import 'package:bkashclone/core/providers/setting/setting_state.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/dower_list_tile.dart';
import 'package:bkashclone/shared/widgets/language_change_button.dart';
import 'package:bkashclone/shared/widgets/show_bottom_dower.dart';
import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BkashEndDower extends StatelessWidget {
  const BkashEndDower({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.80,
      height: double.infinity,
      decoration: BoxDecoration(color: ThemeColors.surface),
      padding: EdgeInsets.all(15),
      child: Consumer(
        builder: (context, ref, child) {
          final red = ref.watch(settingProviderProvider);
          return Column(
            children: [
              SizedBox(height: 60),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  TextWidgetSwitcher(
                    context.l10n.bKashMenu,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: .w600,
                      color: ThemeColors.primary,
                    ),
                  ),
                  LanguageChangeButton(),
                ],
              ),
              if (red.screenView == ScreenView.home) AvaAI(),

              SizedBox(height: 40),
              DowerListTile(
                title: l10n.home,
                onTap: () {
                  if (red.screenView == ScreenView.onboarding) {
                    showBottomDower(context);
                  }
                },
              ),
              if (red.screenView == ScreenView.home)
                DowerListTile(title: l10n.statements),
              if (red.screenView == ScreenView.home)
                DowerListTile(title: l10n.limit),
              DowerListTile(
                title: l10n.customer_service,
                onTap: () {
                  if (red.screenView == ScreenView.onboarding) {
                    showBottomDower(context);
                  }
                },
              ),
              if (red.screenView == ScreenView.home)
                DowerListTile(title: l10n.bkash_map),
              if (red.screenView == ScreenView.home)
                DowerListTile(title: l10n.information_update),
              if (red.screenView == ScreenView.home)
                DowerListTile(title: l10n.nominee_update),
              if (red.screenView == ScreenView.home)
                DowerListTile(title: l10n.discover_bkash),
              if (red.screenView == ScreenView.home)
                DowerListTile(title: l10n.refer_bkash_app),
              if (red.screenView == ScreenView.home)
                DowerListTile(title: l10n.logout),
            ],
          );
        },
      ),
    );
  }
}

class AvaAI extends StatefulWidget {
  const AvaAI({super.key});

  @override
  State<AvaAI> createState() => _AvaAIState();
}

class _AvaAIState extends State<AvaAI> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: false);

    animation = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(
          begin: ThemeColors.primary,
          end: Colors.deepPurpleAccent,
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.deepPurpleAccent,
          end: ThemeColors.primary,
        ),
        weight: 1,
      ),
    ]).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return RepaintBoundary(
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: animation.value!, blurRadius: 6)],
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                // stops: [0.0, 0.1],
                colors: [ThemeColors.primary, Colors.deepPurpleAccent],
                transform: GradientRotation(controller.value * 6.3),
              ),
              borderRadius: BorderRadius.all(Radius.elliptical(7, 7)),
            ),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(6, 6)),
                color: ThemeColors.surface,
              ),

              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ThemeColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      SvgAssets.home,
                      width: 20,
                      color: ThemeColors.surface,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Row(
                        mainAxisSize: .min,
                        children: [
                          TextWidgetSwitcher(context.l10n.ava),
                          SizedBox(width: 5),
                          Container(
                            height: 18,
                            width: 50,
                            decoration: BoxDecoration(
                              color: ThemeColors.primary,
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(4, 4),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "BETA",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: .w400,
                                  color: ThemeColors.surface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      TextWidgetSwitcher(context.l10n.activevirtualassistand),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
