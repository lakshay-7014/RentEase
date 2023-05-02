import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:minor/screens/pages/category_screen.dart';
import 'package:minor/screens/pages/home_screen.dart';
import 'package:minor/screens/pages/test_screen.dart';
import 'package:minor/screens/phone_screen.dart';
import 'package:minor/screens/profile_screen.dart';
import 'const/string_const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConst.appTitle,
      navigatorKey: navigatorKey,
      home: PhoneScreen(),
      // home: ProfileScreen(),
    );
  }
}
