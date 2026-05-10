import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_data.dart';
import 'package:bkashclone/shared/animation/loding_animation.dart';
import 'package:bkashclone/shared/animation/zoom_zoomout_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
              },
            ),
            const Spacer(),
            LodingAnimation(),
          ],
        ),
      ),
    );
  }
}
