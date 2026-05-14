import 'package:flutter/material.dart';

class ZoomInZoomOutAnimation extends StatelessWidget {
  final Widget widget;
  const ZoomInZoomOutAnimation({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return RepeatingAnimationBuilder(
      animatable: TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween<double>(begin: 0.8, end: 0.8),
          weight: 3,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.0,
            end: 0.8,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 0.8, end: 0.8),
          weight: 2,
        ),
        TweenSequenceItem(
          tween: Tween<double>(
            begin: 1.0,
            end: 0.8,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween<double>(begin: 0.8, end: 0.8),
          weight: 3,
        ),
      ]),
      duration: Duration(milliseconds: 2000),
      builder: (context, value, child) {
        return RepaintBoundary(
          child: Transform.scale(scale: value, child: widget),
        );
      },
    );
  }
}

extension ZoomInZoomOutExtension on Widget {
  Widget get zoomInZoomOut => ZoomInZoomOutAnimation(widget: this);
}

class InheritedChild extends InheritedWidget {
  const InheritedChild({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return child != oldWidget.child;
  }
}
