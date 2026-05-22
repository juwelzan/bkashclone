import 'package:flutter/material.dart';

class ShowCustomSnackBar {
  ShowCustomSnackBar._();
  static void top(BuildContext context) {
    final overlay = Overlay.of(context);

    late OverlayEntry overlayEntry;
    void removeSnack() {
      overlayEntry.remove();
    }

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Material(
          color: Colors.black26,
          child: GestureDetector(
            onTap: removeSnack,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.black12),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.amber),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
  }
}
