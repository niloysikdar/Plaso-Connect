import 'package:flutter/material.dart';
import 'package:plaso_connect/widgets/formbanner.dart';

class AddOxygenDetails extends StatefulWidget {
  @override
  _AddOxygenDetailsState createState() => _AddOxygenDetailsState();
}

class _AddOxygenDetailsState extends State<AddOxygenDetails> {
  late TextEditingController titlecontroller;
  late TextEditingController descriptioncontroller;
  late TextEditingController pincontroller;

  String headerstring =
      "Please ensure all the data that you are providing are from verified sources.\nFeeding any false information or spamming will lead to permanent ban.";

  void clearcontrollers() {
    titlecontroller.clear();
    descriptioncontroller.clear();
    pincontroller.clear();
  }

  @override
  void initState() {
    super.initState();
    titlecontroller = TextEditingController();
    descriptioncontroller = TextEditingController();
    pincontroller = TextEditingController();
  }

  @override
  void dispose() {
    titlecontroller.dispose();
    descriptioncontroller.dispose();
    pincontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            formBanner(
              size: size,
              svgPath: "assets/images/medicine.svg",
            ),
          ],
        ),
      ),
    );
  }
}
