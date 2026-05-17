import 'package:flutter/material.dart';

class ZoomInZoomOutAnimation extends StatefulWidget {
  final Widget child;
  const ZoomInZoomOutAnimation({super.key, required this.child});

  @override
  State<ZoomInZoomOutAnimation> createState() => _ZoomInZoomOutAnimationState();
}

class _ZoomInZoomOutAnimationState extends State<ZoomInZoomOutAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    scale = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.8, end: 0.8),
        weight: 2,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0.8,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),

      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.0,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0.8,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0.8,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),

      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.0,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1,
      ),

      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.8, end: 0.8),
        weight: 2,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: widget.child, // 🔥 no rebuild
      builder: (context, child) {
        return RepaintBoundary(
          child: Transform.scale(scale: scale.value, child: child),
        );
      },
    );
  }
}
