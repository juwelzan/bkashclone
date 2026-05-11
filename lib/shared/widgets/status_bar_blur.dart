import 'dart:ui';

import 'package:flutter/material.dart';

class StatusBarBlur extends StatelessWidget {
  const StatusBarBlur({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ClipRRect(
      child: SizedBox(
        height: height * 0.043,
        width: double.infinity,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
