import 'package:flutter/material.dart';
import 'package:plaso_connect/widgets/formbanner.dart';

class AddOxygenDetails extends StatefulWidget {
  @override
  _AddOxygenDetailsState createState() => _AddOxygenDetailsState();
}

class _AddOxygenDetailsState extends State<AddOxygenDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            formBanner(
              size: size,
              svgPath: "assets/images/login.svg",
            ),
          ],
        ),
      ),
    );
  }
}
