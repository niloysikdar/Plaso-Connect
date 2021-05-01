import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plaso_connect/constants/colors.dart';

Widget formBanner({
  required Size size,
  required String svgPath,
}) {
  return Positioned(
    top: 0,
    left: 0,
    child: Container(
      height: size.height * 0.3,
      width: size.width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: klightShadowForLight,
            offset: Offset(0.0, 0.0),
            blurRadius: 7.0,
          ),
          BoxShadow(
            color: kdarkShadowForLight,
            offset: Offset(4.0, 4.0),
            blurRadius: 7.0,
          ),
        ],
        color: Color(0xFFEFEEEE),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        // image: DecorationImage(
        //   image: AssetImage("assets/images/banner2.png"),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: SvgPicture.asset(svgPath),
    ),
  );
}
