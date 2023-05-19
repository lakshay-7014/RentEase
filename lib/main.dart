import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minor/auth/auth_provider.dart';
import 'package:minor/screens/pages/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'const/string_const.dart';
import 'firebase_options.dart';

var uuid = const Uuid();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConst.appTitle,
        navigatorKey: navigatorKey,
        theme: ThemeData(fontFamily: "NunitoSans"),
        home: WelcomeScreen(),
      ),
    );
  }
}
