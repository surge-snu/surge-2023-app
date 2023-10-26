import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:surge_2023_app/Auth/login.dart';
import 'package:surge_2023_app/Home/HomePage.dart';
import 'package:surge_2023_app/Profile/profile.dart';
import 'package:surge_2023_app/contact/contactus.dart';

import 'Splash Screen/splashScreen.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),

      debugShowCheckedModeBanner: false,
      title: 'Surge 2023',

        // This is the theme of your application.

      home: SplashScreen(),
    );
  }
}


