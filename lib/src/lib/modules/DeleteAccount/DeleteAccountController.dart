import 'dart:convert';

import 'package:get/get.dart';
import 'package:gunlox/modules/Login/LoginScreen.dart';
import 'package:gunlox/network/api_client.dart';
import 'package:gunlox/network/endpoints.dart';
import 'package:gunlox/utils/SharedPreference.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class DeleteAccountController extends GetxController {
  RxBool isLoading = false.obs;

  late Map userData;
  var userId;

  // getUserDetails() async {
  //   String userString;

  //   userString = await GunLoxPrefs.getString('user');
  //   userData = jsonDecode(userString);
  //   userId = userData["userId"];
  //   print("userID: $userData");
  //   deleteAccount(userId);
  // }

  deleteAccount(userId, accessToken) async {
    isLoading.value = true;
    print("-- deleteAccount  $userId, $accessToken");

    var response = await ApiClient().commonDeleteAPIMethod(
        '${Endpoints.DELETE_ACCOUNT}/$userId?access_token=$accessToken', null);
    print("-- deleteAccount response $response}");
    if (response!["count"] == 1) {
      print("--DELETED ACCOUNT");
      // GunLoxPrefs.clearPrefs();
      isLoading.value = false;

      Get.offAll(() => const LoginScreen());
      Future.delayed(Duration.zero, () {});
    } else {
      common.showCustomSnackBar("Some error occurred");
    }

    isLoading.value = false;
  }
}
