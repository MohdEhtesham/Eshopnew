import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eshop/modules/ChangeLang/ChangeLangController.dart';
import 'package:eshop/modules/Patients/Home/Application/AppliationStatus.dart';
import 'package:eshop/modules/Patients/Home/Application/ApplicationFilling.dart';
import '/components/CommonFunctions/CommonFunctions.dart' as common;
import 'package:eshop/network/api_client.dart';
import 'package:eshop/network/endpoints.dart';
import 'package:eshop/utils/SharedPreference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PatientInfoController extends GetxController {
  RxBool isActiveButton = false.obs;
  RxBool isLoading = false.obs;
  var currentContext = Get.context;
  var changeLangController = Get.put(ChangeLangController());
  late Map<String, dynamic> applicationData;
  List<dynamic>? filledFields;
  ApplicationStatus applicationStatus = ApplicationStatus();
  var nameController = TextEditingController();
  var email = TextEditingController();
  var mobileController = TextEditingController();
  var address = TextEditingController();
  var city = TextEditingController();
  var state = TextEditingController();
  var zipcode = TextEditingController();
  var dateofbirth = TextEditingController();
  var socialsecnumber = TextEditingController();
  var phone = TextEditingController();
  var cell = TextEditingController();
  var emergencyname = TextEditingController();
  var emergencycontact = TextEditingController();
  var messageController = TextEditingController();
  var medicareid = TextEditingController();
  var medicaidid = TextEditingController();

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

    try {
      Map<String, dynamic> responseData = response!;
      applicationData = responseData['data'];
      print("Response Application Data: $applicationData");

      // Access specific properties of applicationData as needed
      String? id = applicationData!['id'];
      filledFields = applicationData!['filled_fields'];

      Map<String, dynamic>? patientInfo = applicationData!['patient_info'];
      print("Patient Info: $patientInfo");

      nameController.text = applicationData!['patient_info']['name'];
      address.text = applicationData!['patient_info']['address']['city'];
      city.text = applicationData!['patient_info']['address']['city'];
      state.text = applicationData!['patient_info']['address']['state'];
      zipcode.text = applicationData!['patient_info']['address']['zip'];
      ;
      dateofbirth.text = applicationData!['patient_info']['dob'];
      socialsecnumber.text =
          applicationData!['patient_info']['social_security'];
      phone.text = applicationData!['patient_info']['phone_number'];
      cell.text = applicationData!['patient_info']['cell'];
      email.text = applicationData!['patient_info']['email'];
    } catch (e) {
      print("Error decoding JSON: $e");
      isLoading.value = false;
      return;
    }

    isLoading.value = false;
  }
}
