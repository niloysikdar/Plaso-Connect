import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/models/totalstatsmodel.dart';
import 'package:plaso_connect/api/getcovidstats.dart';
import 'package:plaso_connect/widgets/boxdecoration.dart';
import 'package:plaso_connect/widgets/totalstatscard.dart';

class TotalStatsDashboard extends StatefulWidget {
  @override
  _TotalStatsDashboardState createState() => _TotalStatsDashboardState();
}

class _TotalStatsDashboardState extends State<TotalStatsDashboard> {
  TotalStatsModel? totalStatsModel;
  bool isloading = true;
  bool errorLoading = false;
  bool isCountry = true;

  void onLoad() async {
    Response response = await getCovidStats();
    if (response.statusCode == 200) {
      totalStatsModel = totalStatsModelFromJson(response.body);
    } else {
      errorLoading = true;
    }
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    onLoad();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kelectronBlue[800],
          title: Text(
            "Dashboard",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       SizedBox(height: 10),
        //       topButtons(),
        //       SizedBox(height: 20),
        //       (isCountry)
        //           ? countryContainer(size: size)
        //           : statewiseContainer(size: size),
        //     ],
        //   ),
        // ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: 90,
                ),
                child: bodyContainer(size: size),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: kbackgroundLight,
                padding: EdgeInsets.symmetric(vertical: 5),
                width: size.width,
                child: topButtons(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyContainer({required Size size}) {
    Widget finalWidget = Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    );

    if (!isloading) {
      if (!errorLoading) {
        if (isCountry) {
          finalWidget = countryContainer(size: size);
        } else {
          finalWidget = statewiseContainer(size: size);
        }
      } else {
        finalWidget = Center(
          child: Icon(
            Icons.error_rounded,
            size: 50,
            color: kelectronBlue,
          ),
        );
      }
    }

    return finalWidget;
  }

  Widget countryContainer({required Size size}) {
    return statsCard(
      name: "India",
      confirmNumber: totalStatsModel!.data.summary.total,
      activeNumber: totalStatsModel!.data.summary.total -
          (totalStatsModel!.data.summary.discharged +
              totalStatsModel!.data.summary.deaths),
      recoveredNumber: totalStatsModel!.data.summary.discharged,
      deathNumber: totalStatsModel!.data.summary.deaths,
      size: size,
    );
  }

  Widget statewiseContainer({required Size size}) {
    return Column(
      children: totalStatsModel!.data.regional.map((e) {
        return statsCard(
          name: e.loc,
          confirmNumber: e.totalConfirmed,
          activeNumber: e.totalConfirmed - (e.discharged + e.deaths),
          recoveredNumber: e.discharged,
          deathNumber: e.deaths,
          size: size,
        );
      }).toList(),
    );
  }

  Widget topButtons() {
    return Row(
      children: [
        countryStateButton(
          text: "Country",
          ontap: () {
            setState(() {
              isCountry = true;
            });
          },
        ),
        countryStateButton(
          text: "Statewise",
          ontap: () {
            setState(() {
              isCountry = false;
            });
          },
        ),
      ],
    );
  }

  Widget countryStateButton({
    required String text,
    required Function ontap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap as void Function()?,
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: newboxDecoration(),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: kelectronBlue[800],
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
