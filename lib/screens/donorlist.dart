import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plaso_connect/services/database.dart';

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
                    return Text(snapshot.data!.docs[index]["name"]);
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
}
