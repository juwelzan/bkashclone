import 'package:flutter/material.dart';

class LodingAnimation extends StatefulWidget {
  const LodingAnimation({super.key});

  @override
  State<LodingAnimation> createState() => _LodingAnimationState();
}

class _LodingAnimationState extends State<LodingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) => const CircularProgressIndicator()),
    );
  }
}
