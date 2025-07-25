import 'package:fleet_booking_system/constants/color_list.dart';
import 'package:flutter/material.dart';

void snackBarTrigger(BuildContext context, String textSnackBar) {
  var snackBarCard = SnackBar(
    content: Text(
      textSnackBar,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    backgroundColor: ColorList.primary,
    margin: const EdgeInsets.only(bottom: 44.92, left: 16, right: 16),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBarCard);
}
