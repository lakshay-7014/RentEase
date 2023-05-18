import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';


class GetUserModel {
 static Future <UserModel> getusermodelById(String uid) async {
    UserModel? usermodel;
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    if (snapshot.data != null) {
      usermodel = UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
    }

    return usermodel!;
  }
}