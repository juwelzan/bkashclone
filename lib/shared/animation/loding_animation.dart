// ignore_for_file: unused_element, unused_field

import 'dart:async'; // এটা ঠিক

import 'package:flutter/material.dart';

class LodingAnimation extends StatefulWidget {
  const LodingAnimation({super.key});

  @override
  State<LodingAnimation> createState() => _LodingAnimationState();
}

class _LodingAnimationState extends State<LodingAnimation> {
  //show
  ValueNotifier<bool> isFirstDothide = ValueNotifier<bool>(true);
  ValueNotifier<bool> fastDotBackhide = ValueNotifier<bool>(false);
  ValueNotifier<bool> isSecondDothide = ValueNotifier<bool>(false);
  ValueNotifier<bool> secondDotBackhide = ValueNotifier<bool>(false);
  ValueNotifier<bool> isLastDothide = ValueNotifier<bool>(false);
  ValueNotifier<bool> lastDotBackhide = ValueNotifier<bool>(false);

  //animation
  ValueNotifier<bool> fastTosecond = ValueNotifier<bool>(false);
  ValueNotifier<bool> fastTosecond2 = ValueNotifier<bool>(false);
  ValueNotifier<bool> secondTolast = ValueNotifier<bool>(false);
  ValueNotifier<bool> secondTolast2 = ValueNotifier<bool>(false);
  ValueNotifier<bool> lastTofast = ValueNotifier<bool>(false);
  ValueNotifier<bool> lastTofast2 = ValueNotifier<bool>(false);

  Timer? _timer;

  void _startTimer() {
    _timer = Timer(const Duration(milliseconds: 00), () async {
      if (!isFirstDothide.value) isFirstDothide.value = true;
      await Future.delayed(Duration(milliseconds: 1000));
      fastTosecond.value = true;
      await Future.delayed(Duration(milliseconds: 300));
      fastDotBackhide.value = true;
      isFirstDothide.value = false;
      fastTosecond.value = false;
      await Future.delayed(Duration(milliseconds: 1000));
      fastTosecond2.value = true;
      await Future.delayed(Duration(milliseconds: 300));
      isSecondDothide.value = true;
      fastDotBackhide.value = false;
      fastTosecond2.value = false;

      await Future.delayed(Duration(milliseconds: 1000));
      secondTolast.value = true;
      await Future.delayed(Duration(milliseconds: 300));
      secondDotBackhide.value = true;
      isSecondDothide.value = false;
      secondTolast.value = false;
      await Future.delayed(Duration(milliseconds: 1000));
      secondTolast2.value = true;
      await Future.delayed(Duration(milliseconds: 300));
      isLastDothide.value = true;
      secondDotBackhide.value = false;
      secondTolast2.value = false;
      await Future.delayed(Duration(milliseconds: 1000));
      lastTofast.value = true;
      await Future.delayed(Duration(milliseconds: 300));
      lastDotBackhide.value = true;
      isLastDothide.value = false;
      lastTofast.value = false;
      await Future.delayed(Duration(milliseconds: 1000));
      lastTofast2.value = true;
      await Future.delayed(Duration(milliseconds: 300));
      lastDotBackhide.value = false;
      lastTofast2.value = false;
      isFirstDothide.value = true;
      await Future.delayed(Duration(milliseconds: 1000));

      _startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),

        ///
        ///
        ///
        ///
        ///
        ///
        ///

        // fast dot to second dot Positioned
        ValueListenableBuilder(
          valueListenable: isFirstDothide,
          builder: (context, fast, child) {
            return ValueListenableBuilder(
              valueListenable: fastTosecond,
              builder: (context, fts, child) {
                return Positioned(
                  /// fast dot position is 136.3
                  /// second dot position is 176.3
                  /// last dot position is 216.3
                  left: 136.3,
                  child: fast
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 300),

                          /// fast dot width is 60
                          /// second dot width is 20
                          /// last dot width is 20
                          width: fts ? 60 : 20,
                          height: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )
                      : SizedBox(),
                );
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: fastDotBackhide,
          builder: (context, fdb, child) {
            return ValueListenableBuilder(
              valueListenable: fastTosecond2,
              builder: (context, fts2, child) {
                return Positioned(
                  /// fast dot position is 136.3
                  /// second dot position is 176.3
                  /// last dot position is 216.3
                  right: 176.3,
                  child: fdb
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 300),

                          /// fast dot width is 60
                          /// second dot width is 20
                          /// last dot width is 20
                          width: fts2 ? 20 : 60,
                          height: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )
                      : SizedBox(),
                );
              },
            );
          },
        ),

        ///
        ///
        ///
        ///
        ///
        ///

        // second dot to last dot Positioned
        ValueListenableBuilder(
          valueListenable: isSecondDothide,
          builder: (context, sd, child) {
            return ValueListenableBuilder(
              valueListenable: secondTolast,
              builder: (context, stl, child) {
                return Positioned(
                  left: 176.3,
                  child: sd
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: stl ? 60 : 20,
                          height: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )
                      : SizedBox(),
                );
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: secondDotBackhide,
          builder: (context, sdb, child) {
            return ValueListenableBuilder(
              valueListenable: secondTolast2,
              builder: (context, stl2, child) {
                return Positioned(
                  right: 136.3,
                  child: sdb
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: stl2 ? 20 : 60,
                          height: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )
                      : SizedBox(),
                );
              },
            );
          },
        ),

        ///
        ///
        ///
        ///
        ///
        ///
        ///
        ///
        ///

        // last dot to first dot Positioned
        ValueListenableBuilder(
          valueListenable: isLastDothide,
          builder: (context, ld, child) {
            return ValueListenableBuilder(
              valueListenable: lastTofast,
              builder: (context, stf, child) {
                return Positioned(
                  left: 176.3,
                  child: ld
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: stf ? 90 : 20,
                          height: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )
                      : SizedBox(),
                );
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: lastDotBackhide,
          builder: (context, ldb, child) {
            return ValueListenableBuilder(
              valueListenable: lastTofast2,
              builder: (context, ltf2, child) {
                return Positioned(
                  right: 136.3,
                  child: ldb
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: ltf2 ? 20 : 100,
                          height: 20,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        )
                      : SizedBox(),
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }
}
