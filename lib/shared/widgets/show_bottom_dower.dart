import 'package:flutter/material.dart';

void showBottomDower(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 200,
        width: double.infinity,

        decoration: BoxDecoration(color: Colors.amber),
      );
    },
  );
}
