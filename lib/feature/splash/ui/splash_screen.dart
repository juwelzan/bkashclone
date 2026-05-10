import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_data.dart';
import 'package:bkashclone/feature/auth/ui/onboarding_screen.dart';
import 'package:bkashclone/shared/animation/loding_animation.dart';
import 'package:bkashclone/shared/animation/zoom_zoomout_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  void _nextpage(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      extendBody: true,
      extendBodyBehindAppBar: true,

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const Spacer(),
            SvgPicture.asset(
              SvgAssets.bkashLogo,
              width: 180,
              height: 180,
            ).zoomZoomoutAnimation(
              initState: () {
                SystemChrome.setEnabledSystemUIMode(
                  SystemUiMode.immersiveSticky,
                );
                _nextpage(context);
              },
            ),
            const Spacer(),
            LoadingAnimation(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
