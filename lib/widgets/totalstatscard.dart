import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/widgets/boxdecoration.dart';
import 'package:plaso_connect/widgets/circularprogress.dart';

var formatter = NumberFormat('#,##,##,000');

Widget statsCard({
  required String name,
  required int confirmNumber,
  required int activeNumber,
  required int recoveredNumber,
  required int deathNumber,
  required Size size,
}) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    padding: EdgeInsets.all(20),
    decoration: newboxDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: kelectronBlue[800],
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemName(
                  itemname: "Confirmed",
                  itemcount: confirmNumber,
                  titleColor: Color(0xffff073a),
                  countColor: Color(0xffff073a).withOpacity(0.8),
                ),
                itemName(
                  itemname: "Active",
                  itemcount: activeNumber,
                  titleColor: kelectronBlue[900],
                  countColor: kelectronBlue[800],
                ),
                itemName(
                  itemname: "Recovered",
                  itemcount: recoveredNumber,
                  titleColor: Color(0xff28a745),
                  countColor: Color(0xff28a745).withOpacity(0.9),
                ),
                itemName(
                  itemname: "Deaths",
                  itemcount: deathNumber,
                  titleColor: Colors.grey[600],
                  countColor: Colors.grey[600],
                ),
              ],
            ),
            circularProgress(
              size: size,
              percent: (recoveredNumber / (confirmNumber)),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget itemName({
  required String itemname,
  required int itemcount,
  required Color? titleColor,
  required Color? countColor,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 5),
      Text(
        itemname,
        style: TextStyle(
          color: titleColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        formatter.format(itemcount),
        style: TextStyle(
          color: countColor,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
