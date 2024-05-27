import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:eshop/modules/ChangeLang/ChangeLangController.dart';
import 'package:eshop/modules/Donor/Login/DonorLogin.dart';
import 'package:eshop/modules/Patients/Login/LoginVerifyCode.dart';
import 'package:eshop/modules/Patients/Login/PhoneLoginController.dart';
import 'package:eshop/utils/SharedPreference.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  var phoneLoginController = Get.put(PhoneLoginController());
  var changeLangController = Get.put(ChangeLangController());

  bool showResend = true;
  int countdown = 30;
  bool ActiveConnection = false;
  String T = "";

  @override
  void initState() {
    super.initState();

    getUserLanguage();
  }

  Future CheckUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          ActiveConnection = true;
          T = "Turn off the data and repress again";
        });
      }
    } on SocketException catch (_) {
      setState(() {
        ActiveConnection = false;
        T = "Turn On the data and repress again";
      });
    }
  }

  getUserLanguage() async {
    var value;
    value = await TAPrefs.getInt('language');
    print("value dfvhdgfhjdfghjdf $value");
    if (value == null) {
      changeLangController.changeLanguageEnglishFromProfile();
    } else if (value == 0) {
      changeLangController.changeLanguageEnglishFromProfile();
    } else {
      changeLangController.changeLanguageSpanishFromProfile();
    }
  }

  String _selectedCountryCode = '+1'; // Default country code

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImages.splashLogo),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    width: 100.w,
                    height: 10.h,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.welcome,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: CommonFontWeight.regular,
                        fontSize: CommonFontSizes.sp22.sp,
                        color: AppColors.blackColor.withOpacity(.9),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Container(
                    width: 88.w,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.phoneNumber,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: CommonFontWeight.regular,
                                fontSize: CommonFontSizes.sp16.sp,
                                color: AppColors.blackColor.withOpacity(.7),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.disabled,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                            ],
                            validator: (value) {
                              if (value == "") {
                                return AppLocalizations.of(context)!
                                    .phonerequired;
                              }
                              if (!RegExp("[0-9]").hasMatch(value!)) {
                                return AppLocalizations.of(context)!
                                    .phoneNumberError;
                              }
                              if (value.length < 10) {
                                // setState(() {
                                //   phoneLoginController.showVerificationSection.value = false;
                                //   _otpController.text = '';
                                //   phoneLoginController.isOTPEntered.value = false;
                                // });
                                return AppLocalizations.of(context)!
                                    .phoneNumberError;
                              }
                              FocusManager.instance.primaryFocus?.unfocus();
                              return null;
                            },
                            cursorColor: AppColors.blackColor,
                            controller: _phoneController,
                            maxLength: 10,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.whiteColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2.w),
                                borderSide: BorderSide(
                                    color: AppColors.bgColor.withOpacity(.5)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.w),
                                  borderSide: const BorderSide(
                                      color: AppColors.bgColor)),
                              counterText: "",
                              contentPadding:
                                  const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: DropdownButton<String>(
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: "+1",
                                      child: Text(
                                        "+1",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: CommonFontWeight.regular,
                                          fontSize: CommonFontSizes.sp16.sp,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: "+91",
                                      child: Text(
                                        "+91",
                                        style: CommonTextStyles
                                            .poppinsMediumStyle
                                            .copyWith(
                                                color: AppColors.blackColor,
                                                fontSize:
                                                    CommonFontSizes.sp16.sp),
                                      ),
                                    ),
                                  ],
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedCountryCode = value!;
                                    });
                                  },
                                  value:
                                      _selectedCountryCode, // Default country code
                                  underline: Container(), // Removes underline
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              if (_formKey.currentState != null &&
                                  _formKey.currentState!.validate()) {
                                return;
                              }
                            },
                            onFieldSubmitted: (value) {
                              // if (_formKey.currentState!.validate()) {
                              //   print("yes");
                              // }
                            },
                            style: CommonTextStyles.poppinsMediumStyle.copyWith(
                                color: AppColors.blackColor,
                                fontSize: CommonFontSizes.sp16.sp),
                            keyboardType: TextInputType.phone,
                          ),

                          SizedBox(
                            height: 6.h,
                          ),
                          CommonButton(
                            width: 100.w,
                            onPressed: () async {
                              await CheckUserConnection();
                              if (T == "Turn On the data and repress again") {
                                common.showCustomSnackBar(
                                    AppLocalizations.of(context!)!
                                        .checkinternet);
                              } else {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (_formKey.currentState!.validate()) {
                                  Get.to(() =>
                                      LoginVerifyCode(phone: "8888888888"));
                                  // phoneLoginController
                                  //     .sendPhoneCode(_selectedCountryCode,_phoneController.text);
                                }
                              }
                            },
                            buttonText: AppLocalizations.of(context)!.getCode,
                            textColor: AppColors.whiteColor,
                            fontWeight: CommonFontWeight.semiBold,
                            buttonColor: AppColors.bgColor,
                          ),

                          // SizedBox(height: 4.h,),
                        ],
                      ),
                    ),
                  ),
                ),
              
                 SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: Container(
                    // width: 100.w,
                    // height: 30.h,
                    alignment: Alignment.centerRight,
                    child: Image.asset(AppImages.shopping),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    ;
  }
}
