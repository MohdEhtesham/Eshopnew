import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:eshop/modules/ChangeLang/ChangeLangController.dart';
import 'package:eshop/modules/Patients/Home/HomeScreen/HomeScreen.dart';
import 'package:eshop/modules/Patients/Login/Login.dart';
import 'package:eshop/utils/SharedPreference.dart';
import '../../components/CommonFunctions/CommonFunctions.dart' as common;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map? userData;
  bool isFirstLaunch = true;
  bool languageChanged = false;
  var changeLangController = Get.put(ChangeLangController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      getUserDetails();
    });
  }

  getUserDetails() async {
    String userString;
    userString = await TAPrefs.getString('user');
    print("==========>us: ");

    if (userString.isNotEmpty) {
      userData = jsonDecode(userString);
    }
    print("==========>userdata : $userData");

    navigateTo();
  }

  navigateTo() async {
    if (userData != null) {
      common.setToken(userData!["id"]);

      Get.offAll(() => const HomeScreen());
    } else {
      Get.offAll(() => const Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
