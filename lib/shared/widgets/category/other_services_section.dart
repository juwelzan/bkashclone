import 'package:bkashclone/l10n/l10n.dart';
import 'package:bkashclone/shared/widgets/category/category_title.dart';
import 'package:flutter/material.dart';

class OtherServicesSection extends StatefulWidget {
  const OtherServicesSection({super.key});

  @override
  State<OtherServicesSection> createState() => _OtherServicesSectionState();
}

class _OtherServicesSectionState extends State<OtherServicesSection> {
  ValueNotifier<int> pageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageIndex,
      builder: (context, value, child) {
        return SizedBox(
          height: 350,
          child: Column(
            children: [
              SizedBox(height: 20),
              CategoryTitle(title: context.l10n!.otherServices, index: value),
              SizedBox(height: 10),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) => pageIndex.value = value,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _widget(index == 0 ? 12 : 1);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    pageIndex.dispose();
    super.dispose();
  }
}

Widget _widget(int itemCount) {
  return GridView.builder(
    itemCount: itemCount > 12 ? 12 : itemCount,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(0),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 130,
    ),
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.all(5),

        decoration: BoxDecoration(color: Colors.amberAccent),
      );
    },
  );
}
