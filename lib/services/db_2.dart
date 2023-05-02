import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../const/firebase_const.dart';
import '../const/image_const.dart';
import '../models/user_model.dart';

class DbController2 extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxList<UserProfileModel> _userProfileModel = <UserProfileModel>[].obs;

  Future<void> getMyInfo() async {
    _userProfileModel.removeRange(0, _userProfileModel.length);
    try {
      await _firestore
          .collection(FirebaseConst.users)
          .doc(_auth.currentUser?.uid)
          .get()
          .then((querySnapshot) async {
        _userProfileModel.add(UserProfileModel(
          userId: querySnapshot.data()![FirebaseConst.userId],
          //avatar: querySnapshot.data()![FirebaseConst.avatar],
          userName: querySnapshot.data()![FirebaseConst.userName],
          userDescription: querySnapshot.data()![FirebaseConst.userDescription],
          stream: querySnapshot.data()![FirebaseConst.stream],
        ));
      });
    } catch (e) {
      if (kDebugMode) {
        print('DbController2 getMyInfo Error = $e');
      }
    }
  }

  int length() {
    return _userProfileModel.length;
  }

  String userId() {
    return _userProfileModel[0].userId;
  }

  // String avatarImageConst() {
  //   return ImageConst.avatarImageConst(_userProfileModel[0].avatar);
  // }

  String userName() {
    return _userProfileModel[0].userName;
  }

  String userDescription() {
    return _userProfileModel[0].userDescription;
  }

  String stream() {
    return _userProfileModel[0].stream;
  }
}
