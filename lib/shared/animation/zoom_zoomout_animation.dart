// ignore_for_file: unused_field, unused_element

import 'dart:async';

import 'package:flutter/material.dart';

class ZoomZoomoutAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback? initState;
  const ZoomZoomoutAnimation({super.key, required this.child, this.initState});

  @override
  State<ZoomZoomoutAnimation> createState() => _ZoomZoomoutAnimationState();
}

class _ZoomZoomoutAnimationState extends State<ZoomZoomoutAnimation> {
  ValueNotifier<bool> isZoomedIn = ValueNotifier<bool>(false);
  Timer? _timer;
  void _startTimer() {
    (widget.initState != null) ? widget.initState!() : null;
    _timer = Timer(const Duration(milliseconds: 400), () async {
      await Future.delayed(const Duration(milliseconds: 100), () {
        isZoomedIn.value = true;
      });
      await Future.delayed(const Duration(milliseconds: 100), () {
        isZoomedIn.value = false;
      });
      await Future.delayed(const Duration(milliseconds: 100));
      await Future.delayed(const Duration(milliseconds: 100), () {
        isZoomedIn.value = true;
      });
      await Future.delayed(const Duration(milliseconds: 100), () {
        isZoomedIn.value = false;
      });
      await Future.delayed(const Duration(milliseconds: 300));

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
          duration: Duration(milliseconds: 70),
          scale: value ? 1.0 : 0.8,

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
  Widget zoomZoomoutAnimation({VoidCallback? initState}) =>
      ZoomZoomoutAnimation(initState: initState, child: this);
}
