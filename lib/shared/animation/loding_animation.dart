import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  bool _isContinue = true;

  // show notifiers
  final ValueNotifier<bool> isFirstDotShow = ValueNotifier<bool>(true);
  final ValueNotifier<bool> fastDotBackShow = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isSecondDotShow = ValueNotifier<bool>(false);
  final ValueNotifier<bool> secondDotBackShow = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isLastDotShow = ValueNotifier<bool>(false);
  final ValueNotifier<bool> lastDotBackShow = ValueNotifier<bool>(false);

  // animation notifiers
  final ValueNotifier<bool> fastTosecond = ValueNotifier<bool>(false);
  final ValueNotifier<bool> fastTosecond2 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> secondTolast = ValueNotifier<bool>(false);
  final ValueNotifier<bool> secondTolast2 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> lastTofast = ValueNotifier<bool>(false);
  final ValueNotifier<bool> lastTofast2 = ValueNotifier<bool>(false);

  Future<void> _runLoop() async {
    while (mounted && _isContinue) {
      isFirstDotShow.value = true;

      await Future.delayed(const Duration(milliseconds: 650));
      if (!mounted) return;
      fastTosecond.value = true;

      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return;
      fastDotBackShow.value = true;
      isFirstDotShow.value = false;
      fastTosecond.value = false;

      await Future.delayed(const Duration(milliseconds: 650));
      if (!mounted) return;
      fastTosecond2.value = true;

      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return;
      isSecondDotShow.value = true;
      fastDotBackShow.value = false;
      fastTosecond2.value = false;

      await Future.delayed(const Duration(milliseconds: 650));
      if (!mounted) return;
      secondTolast.value = true;

      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return;
      secondDotBackShow.value = true;
      isSecondDotShow.value = false;
      secondTolast.value = false;

      await Future.delayed(const Duration(milliseconds: 650));
      if (!mounted) return;
      secondTolast2.value = true;

      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return;
      isLastDotShow.value = true;
      secondDotBackShow.value = false;
      secondTolast2.value = false;

      await Future.delayed(const Duration(milliseconds: 650));
      if (!mounted) return;
      lastTofast.value = true;

      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return;
      lastDotBackShow.value = true;
      isLastDotShow.value = false;
      lastTofast.value = false;

      await Future.delayed(const Duration(milliseconds: 650));
      if (!mounted) return;
      lastTofast2.value = true;

      await Future.delayed(const Duration(milliseconds: 200));
      if (!mounted) return;
      isFirstDotShow.value = true;
      lastDotBackShow.value = false;
      lastTofast2.value = false;
    }
  }

  Widget _buildAnimatedDot({
    required ValueNotifier<bool> showNotifier,
    required ValueNotifier<bool> animNotifier,
    required double? left,
    required double? right,
    required double expandedWidth,
    bool reverse = false,
  }) {
    return ListenableBuilder(
      listenable: Listenable.merge([showNotifier, animNotifier]),
      builder: (context, _) {
        final isAnimating = animNotifier.value;
        final dotWidth = reverse
            ? (isAnimating ? 20.0 : expandedWidth)
            : (isAnimating ? expandedWidth : 20.0);

        return Positioned(
          left: left,
          right: right,
          child: showNotifier.value
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: dotWidth,
                  height: 20,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: ThemeColors.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _runLoop();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: ThemeColors.secondary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),

        _buildAnimatedDot(
          showNotifier: isFirstDotShow,
          animNotifier: fastTosecond,
          left: width * 0.354,
          right: null,
          expandedWidth: 60,
        ),

        _buildAnimatedDot(
          showNotifier: fastDotBackShow,
          animNotifier: fastTosecond2,
          left: null,
          right: width * 0.451,
          expandedWidth: 60,
          reverse: true,
        ),

        _buildAnimatedDot(
          showNotifier: isSecondDotShow,
          animNotifier: secondTolast,
          left: width * 0.451,
          right: null,
          expandedWidth: 60,
        ),

        _buildAnimatedDot(
          showNotifier: secondDotBackShow,
          animNotifier: secondTolast2,
          left: null,
          right: width * 0.354,
          expandedWidth: 60,
          reverse: true,
        ),

        _buildAnimatedDot(
          showNotifier: isLastDotShow,
          animNotifier: lastTofast,
          left: null,
          right: width * 0.354,
          expandedWidth: 100,
        ),

        _buildAnimatedDot(
          showNotifier: lastDotBackShow,
          animNotifier: lastTofast2,
          left: width * 0.354,
          right: null,
          expandedWidth: 100,
          reverse: true,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _isContinue = false;

    isFirstDotShow.dispose();
    fastDotBackShow.dispose();
    isSecondDotShow.dispose();
    secondDotBackShow.dispose();
    isLastDotShow.dispose();
    lastDotBackShow.dispose();

    fastTosecond.dispose();
    fastTosecond2.dispose();
    secondTolast.dispose();
    secondTolast2.dispose();
    lastTofast.dispose();
    lastTofast2.dispose();

    super.dispose();
  }
}
