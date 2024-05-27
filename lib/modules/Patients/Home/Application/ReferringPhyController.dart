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

class ReferringPhyController extends GetxController {
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
  var nephDocName = TextEditingController();
  var city = TextEditingController();
  var state = TextEditingController();
  var zipcode = TextEditingController();
  var dateoflisted = TextEditingController();
  var socialsecnumber = TextEditingController();
  var phone = TextEditingController();
  var doctorphone = TextEditingController();
  var coordiPhone = TextEditingController();
  var cell = TextEditingController();
  var emergencyname = TextEditingController();
  var emergencycontact = TextEditingController();
  var messageController = TextEditingController();
  var medicareid = TextEditingController();
  var medicaidid = TextEditingController();
  var coordinatorName = TextEditingController();
  var primaryCareDoc = TextEditingController();
  var primaryCareDocphone = TextEditingController();
  var whereareyoulisted = TextEditingController();
  RxInt radio = 10.obs;

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

      nameController.text = applicationData!['referring_physician']['name'];
      address.text = applicationData!['referring_physician']['address']['city'];
      city.text = applicationData!['referring_physician']['address']['city'];
      state.text = applicationData!['referring_physician']['address']['state'];
      zipcode.text = applicationData!['referring_physician']['address']['zip'];
      ;
      phone.text = applicationData!['referring_physician']['phone_number'];
      cell.text = applicationData!['referring_physician']
          ['nephrologist_dialysis_kidney_doctor']["name"];
      email.text = applicationData!['referring_physician']['email'];
      email.text = applicationData!['referring_physician']['nephDocName'];
    } catch (e) {
      print("Error decoding JSON: $e");
      isLoading.value = false;
      return;
    }

    isLoading.value = false;
  }
}
