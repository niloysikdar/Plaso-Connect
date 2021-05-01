import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';

BoxDecoration newboxDecoration() {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: klightShadowForLight,
        offset: Offset(-4.0, -4.0),
        blurRadius: 7.0,
      ),
      BoxShadow(
        color: kdarkShadowForLight,
        offset: Offset(4.0, 4.0),
        blurRadius: 7.0,
      ),
    ],
    color: Color(0xFFEFEEEE),
    borderRadius: BorderRadius.circular(20.0),
  );
}
