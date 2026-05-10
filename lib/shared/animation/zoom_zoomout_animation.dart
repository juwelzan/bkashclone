import 'package:flutter/material.dart';

class ZoomZoomoutAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback? initState;

  const ZoomZoomoutAnimation({super.key, required this.child, this.initState});

  @override
  State<ZoomZoomoutAnimation> createState() => _ZoomZoomoutAnimationState();
}

class _ZoomZoomoutAnimationState extends State<ZoomZoomoutAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    widget.initState?.call();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 560),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.8,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 10, // 60ms
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 18, // 100ms
      ),
      TweenSequenceItem(
        tween: ConstantTween(0.8),
        weight: 18, // 100ms pause
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.8,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 18, // 100ms
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 18, // 100ms
      ),
    ]).animate(_controller);

    _playLoop();
  }

  Future<void> _playLoop() async {
    while (mounted) {
      await _controller.forward(from: 0.0);
      if (!mounted) break;
      _controller.reset();
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(scale: _scaleAnimation.value, child: child);
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

extension ZoomZoomoutAnimationExtension on Widget {
  Widget zoomZoomoutAnimation({VoidCallback? initState}) =>
      ZoomZoomoutAnimation(initState: initState, child: this);
}
