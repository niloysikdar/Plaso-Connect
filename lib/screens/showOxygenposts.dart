import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plaso_connect/constants/colors.dart';
import 'package:plaso_connect/models/oxygenpostmodel.dart';
import 'package:plaso_connect/widgets/boxdecoration.dart';

class ShowOxygenPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Oxygen Posts"),
          centerTitle: true,
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("oxygenPosts")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    OxygenPostModel oxygenPostModel = OxygenPostModel(
                      title: snapshot.data!.docs[index]["title"],
                      description: snapshot.data!.docs[index]["description"],
                      pin: snapshot.data!.docs[index]["pin"],
                      postedOn: snapshot.data!.docs[index]["postedOn"],
                      postedBy: snapshot.data!.docs[index]["postedBy"],
                      postedRole: snapshot.data!.docs[index]["postedRole"],
                    );
                    return oxygenCard(
                      oxygenPostModel: oxygenPostModel,
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

  Widget oxygenCard({
    required OxygenPostModel oxygenPostModel,
    required Size size,
  }) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: newboxDecoration(),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            oxygenPostModel.title,
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 3),
          Text(
            oxygenPostModel.description,
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3),
          Text(
            "Area PIN: ${oxygenPostModel.pin}",
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "30/07/2001 -by Admin",
            style: TextStyle(
              color: kelectronBlue,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3),
          Text(
            "Role: Admin",
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
