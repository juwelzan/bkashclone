// ignore_for_file: file_names

import 'package:bkashclone/shared/widgets/category/category_title.dart';
import 'package:flutter/material.dart';

class ShajationSection extends StatelessWidget {
  const ShajationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Column(
        children: [
          SizedBox(height: 10),
          CategoryTitle(title: "শাজেশন"),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: .horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
