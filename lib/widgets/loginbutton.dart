import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/widgets/boxdecoration.dart';

Widget loginButton({
  required BuildContext context,
  required String text,
  required Function onTap,
}) {
  return InkWell(
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    onTap: onTap as void Function()?,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: newboxDecoration(),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kelectronBlue[700],
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
