import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/widgets/boxdecoration.dart';

Widget inputField({
  required TextEditingController? controller,
  required IconData prefixIcon,
  required String hintText,
  required TextInputType textInputType,
}) {
  return Container(
    decoration: newboxDecoration(),
    child: TextFormField(
      controller: controller,
      keyboardType: textInputType,
      style: TextStyle(
        fontSize: 22,
        color: Colors.grey[700],
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEFEEEE),
        prefixIcon: Icon(
          prefixIcon,
          color: kelectronBlue,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
        errorStyle: TextStyle(
          color: Colors.red.shade700,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
    ),
  );
}
