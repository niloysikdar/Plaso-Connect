import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/models/oxygenpostmodel.dart';
import 'package:plaso_connect/services/database.dart';
import 'package:plaso_connect/widgets/formbanner.dart';
import 'package:plaso_connect/widgets/inputfield.dart';

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

  void postPressed() async {
    var oxygenPostModel = OxygenPostModel(
      title: titlecontroller.text,
      description: descriptioncontroller.text,
      pin: pincontroller.text,
      postedOn: DateTime.now().toString(),
      postedBy: "Admin",
      postedRole: "Admin",
    );
    await DatabaseMethod().uploadOxygen(oxygenPostModel);
    clearcontrollers();
  }

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
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: size.height * 0.35,
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kbackgroundLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0.0, 0.0),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "*$headerstring",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    inputforOxygen(
                      controller: titlecontroller,
                      prefixIcon: Icons.title_rounded,
                      hintText: "Title of the post",
                      textInputType: TextInputType.text,
                      maxLines: 1,
                    ),
                    inputforOxygen(
                      controller: descriptioncontroller,
                      prefixIcon: Icons.description_rounded,
                      hintText: "Full Information",
                      textInputType: TextInputType.text,
                      maxLines: 3,
                    ),
                    inputforOxygen(
                      controller: pincontroller,
                      prefixIcon: Icons.location_on_rounded,
                      hintText: "Area PIN code",
                      textInputType: TextInputType.number,
                      maxLines: 1,
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        postPressed();
                        print("Posted");
                      },
                      child: doneBtn(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget doneBtn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        color: kelectronBlue[700],
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              "Post",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputforOxygen({
    required TextEditingController controller,
    required IconData prefixIcon,
    required String hintText,
    required TextInputType textInputType,
    required int maxLines,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: inputField(
        controller: controller,
        prefixIcon: prefixIcon,
        hintText: hintText,
        textInputType: textInputType,
        maxLines: maxLines,
      ),
    );
  }
}
