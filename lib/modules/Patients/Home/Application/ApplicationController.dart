import 'dart:convert';
import 'package:get/get.dart';
import 'package:eshop/modules/ChangeLang/ChangeLangController.dart';
import 'package:eshop/modules/Patients/Home/Application/AppliationStatus.dart';
import 'package:eshop/modules/Patients/Home/Application/ApplicationFilling.dart';
import '/components/CommonFunctions/CommonFunctions.dart' as common;
import 'package:eshop/network/api_client.dart';
import 'package:eshop/network/endpoints.dart';
import 'package:eshop/utils/SharedPreference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ApplicationController extends GetxController {
  RxBool isActiveButton = false.obs;
  RxBool isLoading = false.obs;
  RxString picture = "".obs;
  late Map userData;
  RxString userId = "".obs;
  RxString applicantId = "".obs;
  RxString name = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;
  RxString Language = "".obs;
  RxString pickOne = "".obs;
  var changeLangController = Get.put(ChangeLangController());
  var currentContext = Get.context;
  RxInt gender = 0.obs;
  RxInt marital = 0.obs;
  RxInt race = 0.obs;
  RxInt hispanic = 0.obs;
  RxInt uscitizen = 0.obs;
  RxInt usresident = 0.obs;
  RxInt speak = 0.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxInt premiumspaid = 0.obs;
  RxInt typeofdailysis = 0.obs;
  RxInt dailysisday = 0.obs;
  RxInt previoustrans = 0.obs;
  RxDouble percentage = 0.0.obs;
  RxDouble isComplete = 1.0.obs;
  late Map<String, dynamic> applicationData;
  List<dynamic>? filledFields;
  ApplicationStatus applicationStatus = ApplicationStatus();

  getformStatus() async {
    isLoading.value = true;

    var token = await TAPrefs.getString('token');
    if (token == null) {
      isLoading.value = false;
      return;
    }

    print("token : $token");
    final response = await ApiClient().commonGetAPIMethod(
      Endpoints.GET_PATIENT_APPLICATION,
      {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print("Response: $response");
    if (response == null) {
      common.showCustomSnackBar(
          AppLocalizations.of(currentContext!)!.completeApplication);
    } else {
      try {
        Map<String, dynamic> responseData = response!;
        applicationData = responseData['data'];
        print("Response Application Data: $applicationData");

        // Access specific properties of applicationData as needed
        String? id = applicationData!['id'];
        filledFields = applicationData!['filled_fields'];
        Map<String, dynamic>? insuranceInfo =
            applicationData!['insurance_info'];
        Map<String, dynamic>? patientInfo = applicationData!['patient_info'];
        percentage.value = (applicationData["percentage"] ?? 0) / 100;

        // Now you can use these variables as needed
        print("ID: $id");
        print("Filled Fields: $filledFields");
        print("Insurance Info: $insuranceInfo");
        print("Patient Info: $patientInfo");
        print("percentagegggg ${applicationData["percentage"]}");
      } catch (e) {
        print("Error decoding JSON: $e");
        isLoading.value = false;
        return;
      }
    }

    isLoading.value = false;
  }

  pickOneValue(value) {
    pickOne.value = value;
    Get.to(() => ApplicationFilling());
  }

  saveApplication(name, city, state, zipcode, socialsecurity, dob, phone, cell,
      email, emergencycontact) async {
    isLoading.value = true;
    var token = await TAPrefs.getString('token');
    print("kkkkkkkkkkkk $zipcode");
    var genderValue = gender.value == 0 ? "Male" : "Female";
    var saveApplicationPayload = {
      "patient_info": {
        "consider_for": pickOne.value,
        "name": name,
        "address": {
          "city": city,
          "state": state,
          "zip": zipcode.isEmpty ? null : int.tryParse(zipcode)
        },
        "social_security": socialsecurity,
        "dob": dob,
        // "dob": "${selectedDate.value.year}-${selectedDate.value.month}-${selectedDate.value.day}",
        "phone_number": phone,
        "cell": cell,
        "email": email,
        "emergency_contact": emergencycontact,
        "language_preference": "en, sf",
        "gender": genderValue,
        "marital_status": marital.value == 0
            ? "Married"
            : marital.value == 1
                ? "Single"
                : marital.value == 2
                    ? "Divorced"
                    : marital.value == 3
                        ? "Widow(er)"
                        : "Separated",
        "us_citizen": uscitizen.value == 0 ? true : false,
        "us_resident": usresident.value == 0 ? true : false,
        "race": race.value == 0
            ? "White"
            : race.value == 1
                ? "Black"
                : race.value == 2
                    ? "Asian"
                    : race.value == 3
                        ? "American Indian/Eskimo/ALEU"
                        : race.value == 4
                            ? "Hawaiian Native/Pacific Islander"
                            : "Other",
        "speak_english": speak.value == 0 ? true : false
      }
    };
    print(" sendCodePayload phonelogin $saveApplicationPayload");

    var response = await ApiClient().commonPostAPIMethod(
        Endpoints.SAVE_PATIENT_APPLICATION,
        {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        jsonEncode(saveApplicationPayload));

    print("show verification section response $response");
  }
}
