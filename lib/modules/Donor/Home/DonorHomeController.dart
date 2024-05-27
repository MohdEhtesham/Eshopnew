import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:eshop/network/api_client.dart';
import 'package:eshop/network/endpoints.dart';
import 'package:eshop/utils/SharedPreference.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DonorHomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isActiveButton = false.obs;
  RxList applicationList = ["abc", "abc"].obs;
  RxList transplantCenterList = ["abc", "abc", "abc", "abc"].obs;
  RxBool isApplicationDataRetrieved = true.obs;
  RxBool isComplete = false.obs;
  RxInt applicationListCurrentIndex = 0.obs;
  var currentContext = Get.context;

  final TextEditingController searchController = TextEditingController();

  contactUs(subject, message) async {
    isLoading.value = true;
    var token = await TAPrefs.getString('token');
    if (token == null) {
      isLoading.value = false;
      return;
    }
    print("token : $token");

    Map<String, dynamic> contactUsPayload = {
      "subject": subject,
      "description": message
    };

    print(contactUsPayload);

    var response = await ApiClient().commonPostAPIMethod(
        Endpoints.CONTACT_US,
        {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        jsonEncode(contactUsPayload));

    if (response!["statusCode"] == 200) {
      print("show verification section");
      Get.back();
      common.showCustomSnackBar(
          AppLocalizations.of(currentContext!)!.supportTicket);

      // common.showCustomSnackBar(response["body"]["message"]);
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
