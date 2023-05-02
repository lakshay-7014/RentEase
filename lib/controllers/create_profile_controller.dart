import 'package:get/get.dart';

import '../const/image_const.dart';
import '../models/create_profile_model.dart';

class CreateProfileController extends GetxController {
  final Rx<CreateProfileModel> _createProfile = CreateProfileModel(
   // avatar: 1,
    userName: 'UserName',
    userDescription: 'User Description.......',
    stream: 'stream.......',
  ).obs;

  // int avatar() {
  //   return _createProfile.value.avatar;
  // }

  // String avatarImageConst() {
  //   return ImageConst.avatarImageConst(_createProfile.value.avatar);
  // }

  String userName() {
    return _createProfile.value.userName;
  }

  String userDescription() {
    return _createProfile.value.userDescription;
  }

  String stream() {
    return _createProfile.value.stream;
  }

  // void updateAvatar(int avatar) {
  //   _createProfile.update((val) {
  //     val!.avatar = avatar;
  //   });
  // }

  void updateUserName(String userName) {
    _createProfile.update((val) {
      val!.userName = userName;
    });
  }

  void updateUserDescription(String userDescription) {
    _createProfile.update((val) {
      val!.userDescription = userDescription;
    });
  }

  void updateStream(String stream) {
    _createProfile.update((val) {
      val!.stream = stream;
    });
  }
}
