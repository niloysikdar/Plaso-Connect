import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';

Widget logoWidget({required Size size}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 30),
    height: size.width * 0.35,
    width: size.width * 0.35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(1000),
      image: DecorationImage(
        image: AssetImage("assets/icons/logo.png"),
        fit: BoxFit.fill,
      ),
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
    ),
  );
}
