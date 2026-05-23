import 'package:bkashclone/shared/widgets/text_widget_switcher.dart';
import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const RowText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Row(children: [TextWidgetSwitcher(text, style: style)]);
  }
}
