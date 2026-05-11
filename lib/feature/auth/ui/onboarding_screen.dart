import 'package:bkashclone/core/assets/png_assets.dart';
import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:bkashclone/feature/auth/widgets/app_regular_feature.dart';
import 'package:bkashclone/shared/widgets/bkash_service_container.dart';
import 'package:bkashclone/shared/widgets/category/Shajation_section.dart';
import 'package:bkashclone/shared/widgets/category/offer_section.dart';
import 'package:bkashclone/shared/widgets/status_bar_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: ThemeColors.primary,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(children: [Image.asset(PngAssets.banner)]),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 20,
            child: Row(
              mainAxisAlignment: .end,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: ThemeColors.surface,
                    border: Border.all(
                      width: 0.8,
                      color: ThemeColors.secondary.withOpacity(0.5),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    SvgAssets.bkashLogo,
                    colorFilter: ColorFilter.mode(ThemeColors.primary, .srcIn),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 73,
            left: 0,
            right: 25,
            child: Row(
              mainAxisAlignment: .end,
              children: [
                Container(
                  height: 18,
                  width: 18,
                  padding: EdgeInsets.all(3.5),
                  decoration: BoxDecoration(
                    color: ThemeColors.surface,
                    border: Border.all(
                      width: 0.8,
                      color: ThemeColors.secondary.withOpacity(0.5),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    SvgAssets.menu,
                    width: 10,
                    height: 10,
                  ),
                ),
              ],
            ),
          ),

          Positioned.fill(
            child: DraggableScrollableSheet(
              initialChildSize: 0.84,
              minChildSize: 0.84,
              maxChildSize: 1.0,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: ThemeColors.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      children: [
                        BkashServiceContainer(),
                        AppRegularFeature(),
                        ShajationSection(),
                        OfferSection(),
                        SizedBox(height: 250),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
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
                    "দারুণ সব সার্ভিস আপনার অপেক্ষায়",
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
                        "লগ ইন / রেজিস্ট্রেশন",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: .w500,
                          color: ThemeColors.primary,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "বিকাশ নম্বর পরিবর্তন",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: .w500,
                      color: ThemeColors.surface,
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///StatusBarBlur
          Positioned(top: 0, left: 0, right: 0, child: StatusBarBlur()),
        ],
      ),
    );
  }
}
