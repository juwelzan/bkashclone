// ignore_for_file: deprecated_member_use

import 'package:bkashclone/shared/widgets/bkash_service_container/bkash_service_item.dart';
import 'package:bkashclone/shared/widgets/bkash_service_container/bottom_expend_button.dart';
import 'package:flutter/material.dart';

class BkashServiceContainer extends StatefulWidget {
  const BkashServiceContainer({super.key});

  @override
  State<BkashServiceContainer> createState() => _BkashServiceContainerState();
}

class _BkashServiceContainerState extends State<BkashServiceContainer> {
  ValueNotifier<bool> isExpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isExpanded,
      builder: (context, value, child) {
        return Stack(
          children: [
            AnimatedContainer(
              curve: Curves.easeInOutSine,
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
              duration: Duration(milliseconds: 800),
              height: value ? 500 : 220,
              width: double.infinity,
              child: GridView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 16,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ServicesItem(),
                  );
                },
              ),
            ),
            BottomExpendButton(
              isExpanded: isExpanded.value,
              onTap: () {
                isExpanded.value = !isExpanded.value;
              },
            ),
          ],
        );
      },
    );
  }
}
