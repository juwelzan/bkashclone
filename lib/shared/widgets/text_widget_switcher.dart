import 'package:flutter/material.dart';

class TextWidgetSwitcher extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextWidgetSwitcher(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,

      child: SizedBox(
        height: 24,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,

            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },

            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                alignment: Alignment.center,
                children: [...previousChildren, ?currentChild],
              );
            },

            child: DefaultTextStyle.merge(
              key: ValueKey(text),

              style: style ?? const TextStyle(),

              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

                strutStyle: const StrutStyle(
                  forceStrutHeight: true,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
