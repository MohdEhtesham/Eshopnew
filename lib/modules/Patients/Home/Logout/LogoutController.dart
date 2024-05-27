import 'dart:convert';

import 'package:get/get.dart';
import 'package:eshop/modules/Patients/Login/Login.dart';
import 'package:eshop/network/api_client.dart';
import 'package:eshop/network/endpoints.dart';
import 'package:eshop/utils/SharedPreference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../components/CommonFunctions/CommonFunctions.dart' as common;

class LogoutController extends GetxController {
  RxBool isLoading = false.obs;
  var currentContext = Get.context;

  logout() async {
    isLoading.value = true;
    var token = await TAPrefs.getString('token');
    if (token == null) {
      isLoading.value = false;
      return;
    }
    print("token : $token");

    var response = await ApiClient().commonPostAPIMethod(
        '${Endpoints.LOGOUT}',
        {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        null);
    print("===========delete $response");

    if (response!["statusCode"] == 200) {
      if (response!["body"]["langCode"] == "1009") {
        print("tttttttttttt ");
        await TAPrefs.remove("user");
        Get.offAll(() => const Login());

        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.logoutsuccess);
      }
    } else {
      if (response!["body"]["langCode"] == "2012") {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.somthingwentworng);
      } else {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.somthingwentworng);
      }
    }
    isLoading.value = false;
  }
}
