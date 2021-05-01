import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget circularProgress({
  required Size size,
  required double percent,
}) {
  return CircularPercentIndicator(
    radius: size.width * 0.30,
    animation: true,
    animationDuration: 1500,
    restartAnimation: true,
    curve: Curves.easeInExpo,
    lineWidth: 15.0,
    percent: percent,
    circularStrokeCap: CircularStrokeCap.butt,
    progressColor: Color(0xff28a745),
  );
}
