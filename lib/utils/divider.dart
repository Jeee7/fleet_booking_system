import 'package:fleet_booking_system/constants/color_list.dart';
import 'package:flutter/material.dart';

Widget gapHeight(double height) {
  return SizedBox(height: height);
}

Widget gapWidth(double width) {
  return SizedBox(width: width);
}

Widget buildDividerWithText() {
  return Row(
    children: [
      Expanded(child: Divider(color: ColorList.gray5, thickness: 1)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          'Or',
          style: TextStyle(color: ColorList.gray5, fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(child: Divider(color: ColorList.gray5, thickness: 1)),
    ],
  );
}
