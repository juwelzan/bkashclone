import 'package:flutter/material.dart';

class SmoothLoading extends StatefulWidget {
  const SmoothLoading({super.key});

  @override
  State<SmoothLoading> createState() => _SingleDotLoaderState();
}

class _SingleDotLoaderState extends State<SmoothLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> dot1Anim;
  late Animation<double> dot2Anim;
  late Animation<double> dot3Anim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat();

    /// Dot 1 → 0% - 33%
    dot1Anim = Tween(begin: 20.0, end: 80.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.33, curve: Curves.easeInOut),
      ),
    );

    /// Dot 2 → 33% - 66%
    dot2Anim = Tween(begin: 20.0, end: 80.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.33, 0.66, curve: Curves.easeInOut),
      ),
    );

    /// Dot 3 → 66% - 100%
    dot3Anim = Tween(begin: 20.0, end: 80.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.66, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  Widget buildDot(Animation<double> anim, double start, double end) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        double t = _controller.value;

        bool isActive = t >= start - 0.05 && t < end + 0.05;

        return SizedBox(
          width: 80,
          child: Center(
            child: Opacity(
              opacity: isActive ? 1 : 0,
              child: Transform.scale(
                scale: isActive ? 1.0 : 0.8,
                child: Container(
                  width: anim.value,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildDot(dot1Anim, 0.0, 0.33),
        buildDot(dot2Anim, 0.33, 0.66),
        buildDot(dot3Anim, 0.66, 1.0),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
