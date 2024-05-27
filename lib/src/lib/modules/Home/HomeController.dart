import 'dart:convert';

import 'package:get/get.dart';
import 'package:gunlox/components/strings/Constants.dart';
import 'package:gunlox/modules/Home/ContactUs.dart';
import 'package:gunlox/modules/Home/MyAccount.dart';
import 'package:gunlox/modules/Login/LoginScreen.dart';
import 'package:gunlox/network/api_client.dart';
import 'package:gunlox/network/endpoints.dart';
import 'package:gunlox/utils/SharedPreference.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isActiveButton = false.obs;

  late Map userData;
  var userId;

  contactUs(userId, subject, message) async {
    isLoading.value = true;
    Map<String, dynamic> contactUsPayload = {
      "userId": userId,
      "subject": subject,
      "description": message
    };
    print(contactUsPayload);
    var response = await ApiClient().commonHeaderPostAPIMethod(
        Endpoints.CONTACT_US, jsonEncode(contactUsPayload));
    print("response verifyPhone Code $response");
    if (response!["error"] != null) {
      common.showCustomSnackBar(response["error"]["message"]);
    } else {
      common.showCustomSnackBar(Constants.contactUsMessage);

    }
      isLoading.value = false;
  }

  changePassword(accessToken, oldPassword,password) async {
    isLoading.value = true;
    Map<String, dynamic> setPassPayload = {
      "oldPassword":oldPassword,
      "newPassword": password,
    };
    print(setPassPayload);
    var response = await ApiClient().commonPostAPIMethod(
        "${Endpoints.CHANGE_USER_PASSWORD}/?access_token=$accessToken",
        {
          'Content-Type': 'application/json',
        },
        jsonEncode(setPassPayload));
    print("set pass response $response");
    if (response == null) {
      common.showCustomSnackBar("Error");
    } else if (response!["error"] != null) {
      common.showCustomSnackBar(response["error"]["message"]);
    } else if (response!["statusCode"] == 200 ||
        response["statusCode"] == 204) {
      common.showCustomSnackBar(Constants.passwordChangeSuccess);
      // Get.off(MyAccount(accessToken: accessToken, userId: userId))

    }
    isLoading.value = false;
  }



  updateUser(accessToken,userId,fullName,phoneNumber) async {
    isLoading.value = true;
     List<String> nameParts = fullName.split(' ');
    String firstName = nameParts.length > 0 ? nameParts[0] : '';
    String lastName =
        nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
    Map<String, dynamic> setPassPayload = {
  "firstName": firstName,
  "lastName": lastName,
  "fullName": fullName,
  "address": "",
  "phone": phoneNumber,
};
    print(setPassPayload);
    var response = await ApiClient().commonPatchAPIMethod(
             "${Endpoints.UPDATE_USER}/${userId}?access_token=${accessToken}",
        {
          'Content-Type': 'application/json',
        },
        jsonEncode(setPassPayload));
    print("set pass response $response");
    if (response!["error"] != null) {
      common.showCustomSnackBar(response["error"]["message"]);
    } else {
      common.showCustomSnackBar(Constants.profileUpdateSuccess);

    }
      isLoading.value = false;;
  }


}
