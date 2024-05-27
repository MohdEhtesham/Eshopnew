import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunlox/modules/Home/ChangePassword.dart';
import 'package:gunlox/modules/Home/ContactUs.dart';
import 'package:gunlox/modules/Home/FindLock.dart';
import 'package:gunlox/modules/Home/HomeScreen.dart.dart';
import 'package:gunlox/modules/Home/MyAccount.dart';
import 'package:gunlox/modules/Home/NoLocks.dart';
import 'package:gunlox/modules/Home/PersonalInformation.dart';
import 'package:gunlox/modules/Home/Safety.dart';
import 'package:gunlox/modules/Splash/SplashScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gun-Lox',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
