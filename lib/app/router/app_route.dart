import 'package:bkashclone/feature/auth/ui/otp_verify_screen.dart';
import 'package:bkashclone/feature/auth/ui/password_screen.dart';
import 'package:bkashclone/feature/auth/ui/phone_number_set_screen.dart';
import 'package:bkashclone/feature/home/ui/home_screen.dart';
import 'package:bkashclone/feature/onboarding/ui/onboarding_screen.dart';
import 'package:bkashclone/feature/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: HomeScreen.path,

  routes: [
    slideTransition(
      page: OnboardingScreen(),
      path: OnboardingScreen.path,
      name: OnboardingScreen.name,
    ),
    slideTransition(
      page: PhoneNumberSetScreen(),
      path: PhoneNumberSetScreen.path,
      name: PhoneNumberSetScreen.name,
    ),
    slideTransition(
      page: OtpVerifyScreen(),
      path: OtpVerifyScreen.path,
      name: OtpVerifyScreen.name,
    ),
    slideTransition(
      page: PasswordScreen(),
      path: PasswordScreen.path,
      name: PasswordScreen.name,
    ),
    slideTransition(
      page: HomeScreen(),
      path: HomeScreen.path,
      name: HomeScreen.name,
    ),
    slideTransition(page: SplashScreen(), path: "/", name: "SplashScreen"),
  ],
  errorBuilder: (context, state) => ErrorPage(error: state.error!),
);

class ErrorPage extends StatelessWidget {
  final GoException error;
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(error.message)));
  }
}

GoRoute slideTransition({
  required String path,
  required String name,
  required Widget page,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slide = Tween(
          begin: Offset(20, 0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(
          position: slide,
          child: RepaintBoundary(child: child),
        );
      },
    ),
  );
}

extension AppRouteExtension on BuildContext {
  void goSplash() => go("/");
  void goOnboardingScreen() => go(OnboardingScreen.name);
}
