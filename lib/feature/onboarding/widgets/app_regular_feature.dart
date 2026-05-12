import 'package:flutter/material.dart';

class AppRegularFeature extends StatelessWidget {
  const AppRegularFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),

            width: 130,
            decoration: BoxDecoration(color: Colors.amber),
          );
        },
      ),
    );
  }
}
