import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/screens/homescreen.dart';
import 'package:plaso_connect/services/transitions.dart';
import 'package:plaso_connect/widgets/boxdecoration.dart';

class LandingScreen extends StatelessWidget {
  final List images = [
    "assets/images/banner1.jpg",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            topCarousel(size: size),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 15),
              child: Text(
                "Register as :",
                style: TextStyle(
                  color: kelectronBlue,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            selectButton(
              text: "Individual\n(Normal/Volunteer)",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  SlideLeftRoute(page: HomeScreen()),
                );
              },
            ),
            selectButton(
              text: "Hospital or\nHealthcare Center",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  SlideLeftRoute(page: HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget topCarousel({required Size size}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: size.height * 0.25,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 1,
        ),
        items: images.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget selectButton({
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
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
