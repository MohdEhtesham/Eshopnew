import 'dart:convert';
import 'package:get/get.dart';
import 'package:eshop/models/PhoneLoginmodel.dart';
import 'package:eshop/modules/Patients/Home/HomeScreen/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/modules/Patients/Login/LoginVerifyCode.dart';
import 'package:eshop/network/api_client.dart';
import 'package:eshop/network/endpoints.dart';
import 'package:eshop/utils/SharedPreference.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class PhoneLoginController extends GetxController {
  RxBool showVerificationSection = false.obs;
  RxString phoneNumber = "".obs;
  RxString selectedCountryCode = "".obs;

  RxBool isOTPEntered = false.obs;
  PhoneLoginModel phoneLogin = PhoneLoginModel();
  String? fcmToken;
  RxBool isLoading = false.obs;
  var value;
  var currentContext = Get.context;

  sendPhoneCode(code, phone) async {
    // phoneNumber.value = "+91$phone";
    var sendCodePayload = {
      "phoneNumber": "$code$phone",
      // "userType": "Directed-Donor"
      // "userType": "Directed-Donor"
      "userType": "Recipient"
    };
    print(" sendCodePayload phonelogin $sendCodePayload");

    var response = await ApiClient().commonPostAPIMethod(
        Endpoints.SEND_OTP,
        {
          'Content-Type': 'application/json',
        },
        jsonEncode(sendCodePayload));

    if (response!["statusCode"] == 200) {
      print("show verification section");
      showVerificationSection.value = true;
      Get.to(() => LoginVerifyCode(phone: code + phone));
      print("=============>: $response");
      if (response!["body"]["langCode"] == "1008") {
        common.showCustomSnackBar(AppLocalizations.of(currentContext!)!.ena);
      }
      // common.showCustomSnackBar(response["body"]["message"]);
      // common.showCustomSnackBar(AppLocalizations.of(MyApp.navKey.currentContext!)!.welcome, );
    } else {
      print("=============>: $response");
      if (response!["body"]["langCode"] == "2008") {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.alreadyexistasdonor);
      } else if (response!["body"]["langCode"] == "2011") {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.phonenumbernotexist);
      } else if (response!["body"]["langCode"] == "2012") {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.somthingwentworng);
      } else {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.somthingwentworng);
      }
    }
  }

  verifyPhoneCode(code, phone) async {
    isLoading.value = true;
    var verifyMobilePayload = {
      "phoneNumber": "$phone",
      "otp": code,
      "fcmToken": "234567890pogfdsk987655678ojvc",
      "languagePreference": await TAPrefs.getInt('language') == 0 ? "en" : "es",
    };
    print("payload verifyPhone Code $verifyMobilePayload");

    var response = await ApiClient().commonPostAPIMethod(
        Endpoints.VERIFY_OTP,
        {
          'Content-Type': 'application/json',
        },
        jsonEncode(verifyMobilePayload));
    print("========>hello : $response");
    if (response!["statusCode"] == 200) {
      print("========>hello : $response");

      // Extract user data from the response
      var userData = response["body"]["data"]["user"];
      var token = response["body"]["data"]["token"];

      // Encode user data into a JSON string
      var user = jsonEncode(userData);

      print("User at phone login --> $user");
      print("User at phone token --> $token");

      await TAPrefs.setString('user', user);
      await TAPrefs.setString('token', token);

      Get.offAll(() => const HomeScreen());

      common.showCustomSnackBar(
          AppLocalizations.of(currentContext!)!.accountlogin);

      // common.showCustomSnackBar(response["body"]["message"]);
    } else {
      if (response!["body"]["langCode"] == "2009") {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.invalidverification);
      } else if (response!["body"]["langCode"] == "2012") {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.somthingwentworng);
      } else {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.somthingwentworng);
      }
    }
    isLoading.value = false;
  }

  resendCode(phone) async {
    isLoading.value = true;

    var sendCodePayload = {"phoneNumber": "+91$phone", "userType": "Recipient"};
    print(" sendCodePayload phonelogin $sendCodePayload");

    var response = await ApiClient().commonPostAPIMethod(
        Endpoints.RESEND_OTP,
        {
          // 'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        jsonEncode(sendCodePayload));

    if (response!["statusCode"] == 200) {
      print("show verification section");
      print("=============>: ${response!["body"]["langCode"]}");
      if (response!["body"]["langCode"] == "1008") {
        common.showCustomSnackBar(AppLocalizations.of(currentContext!)!.ena);
      }
      // common.showCustomSnackBar(response["body"]["message"]);
    } else {
      common.showCustomSnackBar(
          AppLocalizations.of(currentContext!)!.somthingwentworng);
    }

    isLoading.value = true;
  }
}
