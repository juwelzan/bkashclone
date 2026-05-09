// ignore_for_file: unused_field, unused_element

import 'dart:async';

import 'package:flutter/material.dart';

class ZoomZoomoutAnimation extends StatefulWidget {
  final Widget child;
  const ZoomZoomoutAnimation({super.key, required this.child});

  @override
  State<ZoomZoomoutAnimation> createState() => _ZoomZoomoutAnimationState();
}

class _ZoomZoomoutAnimationState extends State<ZoomZoomoutAnimation> {
  ValueNotifier<bool> isZoomedIn = ValueNotifier<bool>(true);
  Timer? _timer;
  void _startTimer() {
    _timer = Timer(const Duration(milliseconds: 400), () {
      isZoomedIn.value = !isZoomedIn.value;
      _startTimer();
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isZoomedIn,
      builder: (context, value, child) {
        return AnimatedScale(
          duration: Duration(milliseconds: 400),
          scale: value ? 1.0 : 0.8,
          curve: Curves.easeIn,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

extension ZoomZoomoutAnimationExtension on Widget {
  Widget get zoomZoomoutAnimation => ZoomZoomoutAnimation(child: this);
}
