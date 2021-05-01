import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plaso_connect/models/donormodel.dart';

class DatabaseMethod {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future uploadDonor(DonorModel donorModel) async {
    var userMap = donorModel.toMap();
    try {
      await firebaseFirestore
          .collection("plasmaDonors")
          .doc(donorModel.name)
          .set(userMap);
      print("Done");
    } catch (e) {
      print(e.toString());
    }
  }
}
