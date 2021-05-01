import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/models/donormodel.dart';
import 'package:plaso_connect/widgets/boxdecoration.dart';

class DonorList extends StatefulWidget {
  @override
  _DonorListState createState() => _DonorListState();
}

class _DonorListState extends State<DonorList> {
  // late Stream alldonors;

  // getallDonors() {
  //   alldonors = DatabaseMethod().getDonors(pin: "733202");
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getallDonors();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Donor List"),
          centerTitle: true,
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("plasmaDonors")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DonorModel donorModel = DonorModel(
                      name: snapshot.data!.docs[index]["name"],
                      phone: snapshot.data!.docs[index]["phone"],
                      age: snapshot.data!.docs[index]["age"],
                      address: snapshot.data!.docs[index]["address"],
                      pin: snapshot.data!.docs[index]["pin"],
                      bloodGroup: snapshot.data!.docs[index]["bloodGroup"],
                      covidStatus: snapshot.data!.docs[index]["covidStatus"],
                      dateOfRecovery: snapshot.data!.docs[index]
                          ["dateOfRecovery"],
                      vaccinationStatus: snapshot.data!.docs[index]
                          ["vaccinationStatus"],
                    );
                    return donorCard(
                      donorModel: donorModel,
                      size: size,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget donorCard({required DonorModel donorModel, required Size size}) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: newboxDecoration(),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${donorModel.name}, ${donorModel.age}, ${donorModel.bloodGroup}",
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 3),
          Text(
            donorModel.address,
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3),
          Text(
            "PIN: ${donorModel.pin}",
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 3),
          Text(
            "Phone: ${donorModel.phone}",
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 3),
          Text(
            (donorModel.vaccinationStatus == "0")
                ? "Not Vaccinated yet"
                : "Vaccinated",
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
