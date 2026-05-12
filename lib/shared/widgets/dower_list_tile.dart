import 'package:bkashclone/core/assets/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DowerListTile extends StatelessWidget {
  const DowerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(SvgAssets.home),
        SizedBox(width: 30),
        Text("Home", style: TextStyle(fontSize: 20, fontWeight: .w500)),
      ],
    );
  }
}
