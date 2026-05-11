import 'package:bkashclone/shared/widgets/category/category_title.dart';
import 'package:flutter/material.dart';

class OfferSection extends StatelessWidget {
  const OfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Column(
        children: [
          SizedBox(height: 20),
          CategoryTitle(title: "অফার"),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: .horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(color: Colors.amber),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
