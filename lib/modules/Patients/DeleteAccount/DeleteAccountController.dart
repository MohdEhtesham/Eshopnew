import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eshop/modules/Patients/Login/Login.dart';

import 'package:eshop/network/api_client.dart';
import 'package:eshop/network/endpoints.dart';
import 'package:eshop/utils/SharedPreference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class DeleteAccountController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool confirmDelete = false.obs;
  RxBool isActiveButton = false.obs;
  var otpController = TextEditingController();
  var currentContext = Get.context;

  late Map userData;
  var userId;

  deleteAccount() async {
    isLoading.value = true;
    var token = await TAPrefs.getString('token');
    if (token == null) {
      // Handle token being null
      isLoading.value = false;
      return;
    }
    print("token : $token");

    var response = await ApiClient().commonPostAPIMethod(
        '${Endpoints.DELETE_ACCOUNT}',
        {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        null);
    print("===========delete $response");
    if (response!["statusCode"] == 200) {
      print("===========te $response");

      if (response!["body"]["langCode"] == "1008") {
        confirmDelete.value = true;
        common.showCustomSnackBar(AppLocalizations.of(currentContext!)!.ena);
      }
    } else {
      print("=============>: $response");
      if (response!["body"]["langCode"] == "2012") {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.somthingwentworng);
      } else {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.somthingwentworng);
      }
    }
    //   confirmDelete.value = true;
    //    common.showCustomSnackBar(response["body"]["message"]);
    // } else {
    //   Get.back();
    //   common.showCustomSnackBar(response["body"]["message"]);
    // }
    isLoading.value = false;
  }

  verifyPhoneCodeForDelete(code) async {
    isLoading.value = true;
    var token = await TAPrefs.getString('token');
    if (token == null) {
      isLoading.value = false;
      return;
    }
    print("token : $token");

    var verifyMobilePayload = {"otp": code};
    print("payload verifyPhone Code $verifyMobilePayload");

    var response = await ApiClient().commonDeleteAPIMethod(
        Endpoints.DELETE_ACCOUNT_VERIFY,
        {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        jsonEncode(verifyMobilePayload));

    print("========>hello : $response");
    if (response!["statusCode"] == 200) {
      confirmDelete.value = true;
      if (response!["body"]["langCode"] == "1011") {
        await TAPrefs.remove("user");
        confirmDelete.value = false;
        Get.offAll(() => Login());

        otpController.text = "";
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.deletedaccout);
      }
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
}
