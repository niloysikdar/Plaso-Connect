import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/screens/selectplasma.dart';
import 'package:plaso_connect/screens/statdashboard.dart';
import 'package:plaso_connect/widgets/boxdecoration.dart';

class HomeScreen extends StatelessWidget {
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
                "What are you looking for ?",
                style: TextStyle(
                  color: kelectronBlue,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            homeButton(
              text: "Latest COVID Stats",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TotalStatsDashboard();
                  }),
                );
              },
            ),
            homeButton(
              text: "Plasma/Blood",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SelectPlasma();
                  }),
                );
              },
            ),
            homeButton(
              text: "Oxygen and support",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TotalStatsDashboard();
                  }),
                );
              },
            ),
            homeButton(
              text: "More",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget homeButton({
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
