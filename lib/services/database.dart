import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plaso_connect/models/donormodel.dart';
import 'package:plaso_connect/models/oxygenpostmodel.dart';

class DatabaseMethod {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future uploadDonor(DonorModel donorModel) async {
    var userMap = donorModel.toMap();
    try {
      await db.collection("plasmaDonors").doc(donorModel.phone).set(userMap);
      print("Done");
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<QuerySnapshot> getDonors({required String pin}) {
    return db
        .collection("plasmaDonors")
        .where("pin", isEqualTo: pin)
        .snapshots();
  }

  Future uploadOxygen(OxygenPostModel oxygenPostModel) async {
    var userMap = oxygenPostModel.toMap();
    try {
      await db
          .collection("oxygenPosts")
          .doc(oxygenPostModel.title)
          .set(userMap);
      print("Done");
    } catch (e) {
      print(e.toString());
    }
  }
}
