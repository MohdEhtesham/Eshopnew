import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:eshop/network/api_client.dart';
import 'package:eshop/network/endpoints.dart';
import 'package:eshop/utils/SharedPreference.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;
import '../../../models/TransplantCenterListModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  RxBool isActiveButton = false.obs;
  RxList applicationList = ["abc", "abc"].obs;
  RxList<TransplantCenterModel> transplantCenterList =
      <TransplantCenterModel>[].obs;
  RxList<TransplantCenterModel> transplantCenterListBySearch =
      <TransplantCenterModel>[].obs;
  RxBool isApplicationDataRetrieved = true.obs;
  RxInt applicationListCurrentIndex = 0.obs;
  final TextEditingController searchController = TextEditingController();

  late Map userData;
  var userId;
  var currentContext = Get.context;

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

  Future<void> getCenters() async {
    isLoading.value = true;
    int lat = 77;
    int long = 28;
    var token = await TAPrefs.getString('token');
    if (token == null) {
      isLoading.value = false;
      return;
    }
    print("token : $token");

    final response = await ApiClient().commonGetAPIMethod(
      "${Endpoints.GET_CENTERS}?lat=$lat&long=$long",
      {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    print("getCenters $response");

    // if (response!["message"] == "Unauthorized or Invalid token.") {
    //   print("getCenters 2$response");
    //   common.showCustomSnackBar(response["message"]);
    // } else {
    if (response != null) {
      TransplantCenterListModel transplantCenterListModel =
          TransplantCenterListModel.fromJson(response);
      transplantCenterList.clear();
      isLoading.value = false;

      for (var element in transplantCenterListModel.data!) {
        transplantCenterList.add(element);
      }
      isLoading.value = false;
      // transplantCenterList.value = transplantCenterListModel.data![].;
    }
    print("transplantCenterList ${transplantCenterList.length}");

    isLoading.value = false;
  }

  Future<void> getCentersbyQuery(String query) async {
    isLoading.value = true;
    int lat = 77;
    int long = 28;
    var token = await TAPrefs.getString('token');
    if (token == null) {
      isLoading.value = false;
      return;
    }
    print("token : $token");

    final response = await ApiClient().commonGetAPIMethod(
      "${Endpoints.GET_CENTERS}?query=$query&lat=$lat&long=$long",
      {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    print("getCenters $response");
    if (response != null) {
      TransplantCenterListModel transplantCenterListModel =
          TransplantCenterListModel.fromJson(response);
      transplantCenterListBySearch.clear();
      for (var element in transplantCenterListModel.data!) {
        transplantCenterListBySearch.add(element);
      }
      // transplantCenterList.value = transplantCenterListModel.data![].;
    }
    print("transplantCenterList ${transplantCenterList.length}");
    isLoading.value = false;
  }
}
