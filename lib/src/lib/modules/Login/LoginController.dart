import 'dart:convert';
import 'package:get/get.dart';
import 'package:gunlox/components/strings/Constants.dart';
import 'package:gunlox/modules/Home/HomeScreen.dart.dart';
import 'package:gunlox/modules/Signup/phoneVerification.dart';
import '../Home/Dashboard.dart';
import 'package:gunlox/modules/Login/loginmodel.dart';
import 'package:gunlox/utils/SharedPreference.dart';
import '../../network/api_client.dart';
import '../../network/endpoints.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class LoginController extends GetxController {
  RxBool isLoginButtonActive = false.obs;
  RxBool isLoading = false.obs;
  RxBool passwordVisible = true.obs;
  Login login = Login();
  String? fcmToken;

  doLogin(email, password) async {
    isLoading.value = true;

    Map<String, dynamic> loginPayload = {
      "email": email.toString().toLowerCase(),
      "password": password,
      "role": "user"
      // "deviceToken": fcmToken,
    };
    String user;

    var response = await ApiClient().commonPostAPIMethod(
        Endpoints.LOGIN,
        {
          'Content-Type': 'application/json',
        },
        jsonEncode(loginPayload));
    // print("FCM TOken $fcmToken");
    // isLoading.value = false;
    print("login response: $response");

    if (response!["error"] != null) {
      common.showCustomSnackBar(response["error"]["message"]);
    } else if (response['id'] != null) {
      common.showCustomSnackBar(Constants.loginSuccess);
      login = Login.fromJson(response);
      user = jsonEncode(login);

      // await GunLoxPrefs.setString('user', user);
      print("user ===>>> $user");
      String accessToken = login.id!;
      String userId = login.userId!;
      String phoneNumber = login.user!.phone!;
      // Get.offAll(() => HomeScreen(
      //       userId: userId,
      //       accessToken: accessToken,
      //     ));
      if (login.user!.phoneNumberVerified!) {
        isLoading.value = false;
        Get.offAll(() => HomeScreen(
              userId: userId,
              accessToken: accessToken,

            ));
      } else {
        Get.to(() => PhoneVerification(
             userId: userId,
            accessToken: accessToken,
            phoneNumber: phoneNumber,
            ));
      }

    }
    // isLoading.value = false;
    // } else if (response!["error"]["statusCode"] == 401 &&
    //       response!["error"]["message"] == "Authorization Required") {
    //     common.showCustomSnackBar(Constants.userError);
    //     // isLoading.value = false;
    //   } else if (response!["error"]["statusCode"] == 400 ||
    //       response!["error"]["statusCode"] == 404) {
    //     common.showCustomSnackBar("${response!["error"]["message"]}");
    //     // isLoading.value = false;
    //   } else if (response!["error"]["statusCode"] == 422) {
    //     common.showCustomSnackBar("${response!["error"]["message"]}");
    //     // isLoading.value = false;
    //   }
    // } else if (response!["id"] != null) {
    //   login = Login.fromJson(response);
    //   // isUserMobileVerified.value = response!["user"]["_isMobileVerified"],
    //   // print(response!["user"]["mobile"]["e164Number"]),
    //   // access_token.value = login.id!,
    //   print(login!.user!.isTherapist!);
    //   common.setToken(login.id!);
    //   common.setUserType(login.user!.userType ?? "user");

    //   //setting and saving the information of user
    //   user = jsonEncode(login);
    //   print("user ===>>> ${user}");
    //   if (login.user!.bIsEmailVerified! && login.user!.bIsMobileVerified!) {
    //     isLoading.value = false;
    //     Get.offAll(() => DashboardPage(
    //       isTherapist: common.getUserType,
    //       index: 1,
    //     ));
    //   }
    //   if (!login.user!.bIsEmailVerified!) {
    //     Get.to(() => SignUpEmailVerifyScreen(
    //           email: login.user!.email!,
    //           phone: login.user!.mobile!.e164Number!,
    //           signUpRoute: false,
    //           isEmailVerified: login.user!.bIsEmailVerified!,
    //           isPhoneVerified: login.user!.bIsMobileVerified!,
    //         ));
    //   } else if (!login.user!.bIsMobileVerified!) {
    //     Get.to(() => SignUpPhoneVerifyScreen(
    //           email: login.user!.email!,
    //           phone: login.user!.mobile!.e164Number!,
    //           signUpRoute: false,
    //           isEmailVerified: login.user!.bIsEmailVerified!,
    //           isPhoneVerified: login.user!.bIsMobileVerified!,
    //         ));
    //   }
    // }

    isLoading.value = false;
  }
}
