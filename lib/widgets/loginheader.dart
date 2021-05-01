import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaso_connect/constants/colors.dart';

Widget loginHeader({required Size size}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 20),
        child: SvgPicture.asset(
          "assets/images/login.svg",
          height: size.height * 0.3,
          placeholderBuilder: (context) {
            return SizedBox(
              height: 150,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      Text(
        "Welcome",
        style: TextStyle(
          color: kelectronBlue[900],
          fontSize: 35,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),
      ),
      SizedBox(height: 25),
    ],
  );
}
