import 'package:bkashclone/app/router/app_route.dart';
import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:bkashclone/core/theme/theme_data.dart';
import 'package:bkashclone/shared/animation/zoom_in_zoom_out_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' as svg;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Widget bkashIcon;
  @override
  void initState() {
    bkashIcon = svg.SvgPicture.asset(
      SvgAssets.bkashLogo,
      width: 180,
      height: 180,
    );
    super.initState();
    nextScreen();
  }

  void nextScreen() {
    Future.delayed(Duration(seconds: 6), () {
      context.goOnboardingScreen();
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
            ZoomInZoomOutAnimation(child: RepaintBoundary(child: bkashIcon)),
            const Spacer(),
            // FpsMonitor(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class FpsMonitor extends StatefulWidget {
  const FpsMonitor({super.key});

  @override
  State<FpsMonitor> createState() => _FpsMonitorState();
}

class _FpsMonitorState extends State<FpsMonitor> {
  int _fps = 0;
  int _frameCount = 0;
  DateTime _lastCheck = DateTime.now();

  @override
  void initState() {
    super.initState();
    // ✅ addPostFrameCallback — প্রতি frame এ count করো
    _scheduleFrameCallback();
  }

  void _scheduleFrameCallback() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _frameCount++;
      final now = DateTime.now();
      if (now.difference(_lastCheck).inMilliseconds >= 1000) {
        if (mounted) {
          setState(() {
            _fps = _frameCount;
            _frameCount = 0;
            _lastCheck = now;
          });
        }
      }
      if (mounted) _scheduleFrameCallback(); // ✅ next frame
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        // ✅ color দিয়ে FPS status দেখাও
        color: _fps >= 55 ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '$_fps FPS',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
