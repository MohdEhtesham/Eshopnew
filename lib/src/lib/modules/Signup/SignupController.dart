import 'dart:convert';
import 'package:get/get.dart';
import 'package:gunlox/components/strings/Constants.dart';
import 'package:gunlox/modules/Signup/SignupModel.dart';
import 'package:gunlox/modules/Signup/TermsAndCondition.dart';
import '../../network/api_client.dart';
import '../../network/endpoints.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class SignupController extends GetxController {
  Signup signup = Signup();
  RxBool isRegisterButtonActive = false.obs;
  RxBool isLoading = false.obs;
  RxBool passwordVisible = true.obs;
  RxBool passwordVisible2 = true.obs;
  RxBool checkBoxValue = false.obs;
  RxBool isVerifyButtonActive = false.obs;

  String? fcmToken;

  registerUser(fullname, email, phonenumber, password, confirmpassword) async {
    isLoading.value = true;

    // Splitting full name into first name and last name
    List<String> nameParts = fullname.split(' ');
    String firstName = nameParts.length > 0 ? nameParts[0] : '';
    String lastName =
        nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';
    String phoneNumber = "+91$phonenumber";
    Map<String, dynamic> loginPayload = {
      "firstName": firstName,
      "lastName": lastName,
      "fullName": fullname,
      "email": email.toString().toLowerCase(),
      "password": password,
      "phone": phoneNumber,
      "confirmpassword": confirmpassword
    };

    var response = await ApiClient().commonPostAPIMethod(
      Endpoints.SIGNUP,
      {
        'Content-Type': 'application/json',
      },
      jsonEncode(loginPayload),
    );
    print("Signup response: $response");
    if (response!["error"] != null) {
      common.showCustomSnackBar(response!["error"]["message"]);
    } else {
      // common.showCustomSnackBar(Constants.SignupSuccess);
      signup = Signup.fromJson(response);
      Get.to(() => TermsAndCondition(
            phoneNumber: phoneNumber,
            accessToken :response!["token"]["id"],
            userId :response!["token"]["userId"],
          ));
    }

    print("login response: $response");

    isLoading.value = false;
  }
}
