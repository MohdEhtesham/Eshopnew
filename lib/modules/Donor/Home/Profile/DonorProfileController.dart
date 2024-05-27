// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:eshop/components/strings/Constants.dart';
import 'package:eshop/models/ImageUpload.dart';
import 'package:eshop/modules/ChangeLang/ChangeLangController.dart';
import 'package:eshop/modules/Donor/Home/Profile/DonorProfile.dart';
import 'package:eshop/network/api_client.dart';
import 'package:eshop/network/endpoints.dart';
import 'package:eshop/utils/SharedPreference.dart';
import '/components/CommonFunctions/CommonFunctions.dart' as common;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:convert';

import 'package:http_parser/http_parser.dart';

class DonorProfileController extends GetxController {
  RxBool isButtonActive = false.obs;
  RxBool isLoading = false.obs;
  RxBool passwordVisible = true.obs;
  RxString picture = "".obs;
  late Map userData;
  RxString userId = "".obs;
  RxString applicantId = "".obs;
  RxString name = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;
  RxString Language = "".obs;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var changeLangController = Get.put(ChangeLangController());
  var currentContext = Get.context;

  getUserById() async {
    isLoading.value = true;

    var token = await TAPrefs.getString('token');
    if (token == null) {
      isLoading.value = false;
      return;
    }
    print("token : $token");
    var response = await ApiClient().commonGetAPIMethod(
      Endpoints.GET_USER,
      {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    print("=====>: $response['data']['name']");
    userId.value = response!["data"]["_id"] ?? Constants.nA;
    applicantId.value = response!["data"]["applicantId"] ?? Constants.nA;
    name.value = response!["data"]["name"] ?? Constants.nA;
    email.value = response!["data"]["email"] ?? Constants.nA;
    phone.value = response!["data"]["phoneNumber"] ?? Constants.nA;
    Language.value = response!["data"]["languagePreference"] ?? Constants.nA;
    mobileController.text = response!["data"]["phoneNumber"] ?? Constants.nA;
    nameController.text = response!["data"]["name"] ?? Constants.nA;
    emailController.text = response!["data"]["email"] ?? Constants.nA;
    picture.value = response!["data"]["profileImage"] ?? "";
    phone.value = trimCountryCode(phone.value);
    if (Language.value == "en") {
      await changeLangController.changeLanguageEnglishFromProfile();
    } else {
      await changeLangController.changeLanguageSpanishFromProfile();
    }

    isLoading.value = false;
  }

  String trimCountryCode(String phoneNumber) {
    try {
      final countryCode = phoneNumber.startsWith('+')
          ? phoneNumber.substring(1, phoneNumber.length - 10)
          : '';
      final nationalNumber = phoneNumber.replaceFirst('+$countryCode', '');
      return nationalNumber;
    } catch (e) {
      print('Error trimming country code: $e');
      return phoneNumber;
    }
  }

  RxInt radio = 0.obs;

  getStringValuesSF() async {
    // Fetch the integer value from SharedPreferences
    int? language = await TAPrefs.getInt('language');

    // Assign the fetched value to the RxInt variable
    radio.value = language!;
  }

  updateProfile(profileImagePath, username, email, radio) async {
    isLoading.value = true;
    try {
      var token = await TAPrefs.getString('token');
      if (token == null) {
        isLoading.value = false;
        return;
      }
      print("token : $token");

      if (profileImagePath.isNotEmpty) {
        // If an image is selected, upload it and update the profile
        await imageFileUpload(
          profileImagePath,
          token,
          username,
          email,
          radio == 0 ? "en" : "es",
        );
      } else {
        // If no image is selected, update the profile without uploading an image
        await updateUserProfile(
            token, username, email, radio == 0 ? "en" : "es");
      }
    } catch (e) {
      common.showCustomSnackBar('$e');
    }

    isLoading.value = false;
  }

  updateUserProfile(
      String token, String username, String email, String radio) async {
    isLoading.value = true;

    var updateProfilePayload = {
      "name": username,
      "email": email,
      "languagePreference": radio,
    };

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    var response = await ApiClient().commonPutAPIMethod(
      Endpoints.UPDATE_USER,
      headers,
      jsonEncode(updateProfilePayload),
    );
    print("rrrrrrrrrrrrrrrrrrrrrrrrr: $radio");
    if (response != null && response["statusCode"] == 200) {
      if (radio == "en") {
        await changeLangController.changeLanguageEnglishFromProfile();
      } else {
        await changeLangController.changeLanguageSpanishFromProfile();
      }
      print("Profile updated successfully");
      Get.back();
      getUserById();

      Future.delayed(Duration(seconds: 1), () {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.profileUpdated);
      });
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

  imageFileUpload(String profileImagePath, String token, String username,
      String email, String radio) async {
    isLoading.value = true;

    try {
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            Endpoints.UPDATE_USER), // Replace this with your actual update URL
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['name'] = username;
      request.fields['email'] = email;
      request.fields['languagePreference'] = radio;
      request.files
          .add(await http.MultipartFile.fromPath('profile', profileImagePath));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var jsonResponse = json.decode(response.body);
      var message = jsonResponse["message"];
      print("Message: $message");

      if (response.statusCode == 200) {
        print("Profile image uploaded successfully : ${response.body}");
        if (radio == "en") {
          await changeLangController.changeLanguageEnglishFromProfile();
        } else {
          await changeLangController.changeLanguageSpanishFromProfile();
        }
        Get.back();
        getUserById();
        Future.delayed(Duration(seconds: 1), () {
          common.showCustomSnackBar(
              AppLocalizations.of(currentContext!)!.profileUpdated);
        });

        // common.showCustomSnackBar(response["body"]["message"]);
      } else {
        common.showCustomSnackBar(
            AppLocalizations.of(currentContext!)!.somthingwentworng);
      }
    } catch (e) {
      print("Error uploading profile image: $e");
      common.showCustomSnackBar("Error uploading profile image");
      isLoading.value = false;
    }
    isLoading.value = false;
  }

//  updateProfile(profileImage, name, email, radio) async {
//     isLoading.value = true;
//      var profileName = "";
//     try {
//        if (profileImage.isNotEmpty) {
//       profileName = await imageFileUpload("user", profileImage);
//     }

//     Map<String, dynamic> updateProfilePayload = {
//       "name": name,
//       "profile": profileName,
//       "email": email,
//       "languagePreference": radio == 0 ? "en" : "es",
//     };

//     print("---------------> $radio");
//     var token = await TAPrefs.getString('token');
//     if (token == null) {
//       isLoading.value = false;
//       return;
//     }
//     print("token : $token");

//     var response = await ApiClient().commonPutAPIMethod(
//         "${Endpoints.UPDATE_USER}",
//         {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         jsonEncode(updateProfilePayload));

//     print("Profile response: $response ");
//      if (response!["statusCode"] == 200) {
//         print("========>hello : $response");
//          if (radio == 0) {
//         await changeLangController.changeLanguageEnglish();
//       } else {
//         await changeLangController.changeLanguageSpanish();
//       }

//       Future.delayed(Duration.zero, () {
//         Get.off(() => const DonorProfile());
//  common.showCustomSnackBar(response["body"]["message"]);
//       });

//       } else {
//         common.showCustomSnackBar(response["body"]["message"]);
//       }

//     } catch (e) {
//       common.showCustomSnackBar('${e}');

//     }

//     isLoading.value = false;
//   }
//   Future<String> imageFileUpload(container, file) async {
//     var fileName = "";
//     var request =
//         http.MultipartRequest('POST', Uri.parse("${Endpoints.UPDATE_USER}"));

//     // request.files.add(await http.MultipartFile.fromPath('photo', file));
//     var multipartFile = await http.MultipartFile.fromPath('photo', file,
//         contentType: MediaType(
//           'image',
//           'jpeg',
//         ));

//     request.files.add(multipartFile);

//     var response = await request.send();

//     if (response.statusCode == 200) {
//       print("sdsffsdfsdf ===>>>");
//       // print(await response.stream.bytesToString());
//       String responseString = await response.stream.bytesToString();
//       final responseData = jsonDecode(responseString);
//       ImageUpload imageUpload = ImageUpload.fromJson(responseData);
//       fileName = imageUpload.result!.files!.photo![0].name!;
//     } else {
//       print("fail ===>>>");
//       print(response.reasonPhrase);
//     }

//     return fileName ?? "";
//   }
}
