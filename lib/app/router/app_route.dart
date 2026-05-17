import 'package:bkashclone/feature/onboarding/ui/onboarding_screen.dart';
import 'package:bkashclone/feature/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: "/",
  debugLogDiagnostics: true,

  routes: [
    slideTransition(page: OnboardingScreen(), path: OnboardingScreen.name),
    slideTransition(page: SplashScreen(), path: "/"),
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

GoRoute slideTransition({required String path, required Widget page}) {
  return GoRoute(
    path: path,
    name: path,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slide = Tween(
          begin: Offset(20, 0),
          end: Offset.zero,
        ).animate(animation);
        return SlideTransition(position: slide, child: child);
      },
    ),
  );
}

extension AppRouteExtension on BuildContext {
  void goSplash() => go("/");
  void goOnboardingScreen() => go(OnboardingScreen.name);
}
