import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/screens/addoxygen.dart';
import 'package:plaso_connect/screens/showOxygenposts.dart';
import 'package:plaso_connect/services/transitions.dart';
import 'package:plaso_connect/widgets/boxdecoration.dart';

class SelectOxygen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 15),
              child: Text(
                "Choose an option :",
                style: TextStyle(
                  color: kelectronBlue,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            selectOxygenButton(
              text: "Add a Source",
              onTap: () {
                Navigator.push(
                  context,
                  SlideLeftRoute(page: AddOxygenDetails()),
                );
              },
            ),
            selectOxygenButton(
              text: "Available Sources",
              onTap: () {
                Navigator.push(
                  context,
                  SlideLeftRoute(page: ShowOxygenPosts()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget selectOxygenButton({
    required String text,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        padding: EdgeInsets.all(15),
        decoration: newboxDecoration(),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
