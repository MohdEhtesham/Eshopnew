import 'dart:convert';

import 'package:get/get.dart';
import 'package:gunlox/components/strings/Constants.dart';
import 'package:gunlox/modules/Home/HomeScreen.dart.dart';
import 'package:gunlox/modules/Login/LoginScreen.dart';
import 'package:gunlox/network/api_client.dart';
import 'package:gunlox/network/endpoints.dart';
import 'package:http/http.dart' as http;
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class PhoneVerificationController extends GetxController {
  RxString phoneNumber = "".obs;
  RxBool isOTPEntered = false.obs;
  bool isActiveButton = false;

  verifyPhoneCode(code, phoneNumber) async {
    Map<String, dynamic> verifyMobilePayload = {
      "phone": phoneNumber,
      "otp": code
    };
    print("payload verifyPhone Code $verifyMobilePayload");

    var response = await ApiClient().commonHeaderPostAPIMethod(
        Endpoints.VERIFY_OTP, jsonEncode(verifyMobilePayload));
    if (response!["error"] != null) {
      common.showCustomSnackBar(response["error"]["message"]);
    } else {
      common.showCustomSnackBar(Constants.registerSuccess);
      isActiveButton = true;
      


      Get.offAll(() =>  HomeScreen(
      accessToken: response["message"]["token"]["id"] ?? "",
      userId: response["message"]["token"]["id"] ?? "",

      ));
    }
    print("response verifyPhone Code $response");
  }

  resendPhoneCode(phone, String accessToken) async {
    var sendCodePayload = {
      "phone": phone,
    };
    print(" sendCodePayload hello $sendCodePayload ,$accessToken");
    var response = await ApiClient().commonPostAPIMethod(
        Endpoints.RESEND_OTP,
        {
          'Content-Type': 'application/json',
          'Authorization': accessToken,
        },
        jsonEncode(sendCodePayload));
    print("response send mobile code $response");
    // if (response!["error"] != null) {
    //   common.showCustomSnackBar(response!["error"]["message"]);
    // } else {
    //   print("show verification section");
    //   // showVerificationSection.value = true;
    // }
  }
}
