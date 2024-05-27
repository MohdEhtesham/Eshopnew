import 'dart:convert';

import 'package:get/get.dart';
import 'package:gunlox/components/strings/Constants.dart';
import 'package:gunlox/modules/Login/LoginScreen.dart';
import 'package:gunlox/network/api_client.dart';
import 'package:gunlox/network/endpoints.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class PhoneLoginController extends GetxController {
  RxBool showVerificationSection = false.obs;
  RxString phoneNumber = "".obs;
  RxBool isOTPEntered = false.obs;

  sendPhoneCode(phone) async {
    phoneNumber.value = "+91$phone";
    var sendCodePayload = {
      "phone": "+91$phone"
      //Modified acc to Indian numbers for now
      //Need to change: Rohan
    };
    print(" sendCodePayload $sendCodePayload");
    var response = await ApiClient().commonHeaderPostAPIMethod(
        Endpoints.SEND_OTP, jsonEncode(sendCodePayload));
    print("response send mobile code $response");
    if (response!["error"] != null) {
      common.showCustomSnackBar(response!["error"]["message"]);
    } else {
      print("show verification section");
      showVerificationSection.value = true;
    }
  }

  verifyPhoneCode(code) async {
    Map<String, dynamic> verifyMobilePayload = {
      "phone": phoneNumber.value,
      "otp": code
    };
    print("payload verifyPhone Code $verifyMobilePayload");

    var response = await ApiClient().commonHeaderPostAPIMethod(
        Endpoints.VERIFY_OTP, jsonEncode(verifyMobilePayload));
    if (response!["error"] != null) {
      common.showCustomSnackBar(response["error"]["message"]);
    } else {
      common.showCustomSnackBar(Constants.loginSuccess);
      Get.offAll(() => const LoginScreen());
    }
    print("response verifyPhone Code $response");
  }
}
