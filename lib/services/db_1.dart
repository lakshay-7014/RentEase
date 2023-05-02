import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../const/firebase_const.dart';
import '../controllers/create_profile_controller.dart';

class DbController1 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CreateProfileController _createProfileController = Get.find();

  Future<void> saveUserInfo() async {
    try {
      User? user = _auth.currentUser;
      return _firestore
          .collection(FirebaseConst.users)
          .doc("FaDHKTkl7EOIO2QNza9WNjBQEIr1")
          .set(
        {
          FirebaseConst.userId: "FaDHKTkl7EOIO2QNza9WNjBQEIr1",
          // FirebaseConst.avatar: _createProfileController.avatar(),
          FirebaseConst.userName: _createProfileController.userName(),
          FirebaseConst.userDescription:
              _createProfileController.userDescription(),
          FirebaseConst.stream: _createProfileController.stream(),
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print('DbController1 saveUserInfo Error = $e');
      }
    }
  }
}
