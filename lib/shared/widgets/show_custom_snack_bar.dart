import 'package:bkashclone/core/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class ShowCustomSnackBar {
  ShowCustomSnackBar._();
  static void top(BuildContext context, {String? message}) {
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
                    decoration: BoxDecoration(color: Colors.red[400]),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .center,
                      children: [
                        const SizedBox(height: 35),
                        Text(
                          message ?? "Message",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: .w400,
                            color: ThemeColors.surface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: 4), () => overlayEntry.remove());
  }
}
