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
import 'package:eshop/modules/Donor/Login/DonorPhoneLoginController.dart';
import 'package:eshop/modules/Patients/Login/Login.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;

class DonorLogin extends StatefulWidget {
  const DonorLogin({super.key});

  @override
  State<DonorLogin> createState() => _DonorLoginState();
}

class _DonorLoginState extends State<DonorLogin> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  var donorPhoneLoginController = Get.put(DonorPhoneLoginController());
  String _selectedCountryCode = '+1'; // Default country code
  bool showResend = true;
  int countdown = 30;
  bool ActiveConnection = false;
  String T = "";

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

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(255, 42, 94, 95),
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Image.asset(
                    AppImages.whitesplash,
                  ),
                ),
                // Container(
                //   alignment: Alignment.center,
                //   height: 20.h,
                //   width: 50.w,
                //   decoration: const BoxDecoration(
                //     // color: Colors.red,
                //     image: DecorationImage(
                //       image: AssetImage(AppImages.splashLogo),
                //       fit: BoxFit.contain,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    AppLocalizations.of(context)!.welcome,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: CommonFontWeight.regular,
                      fontSize: CommonFontSizes.sp22.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    AppLocalizations.of(context)!.donorsignup,
                    softWrap: true,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: CommonFontWeight.semiBold,
                      fontSize: CommonFontSizes.sp20.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 25),
                //   child: Text(
                //     AppLocalizations.of(context)!.donortext,
                //     style: TextStyle(
                //       fontFamily: "Poppins",
                //       fontWeight: CommonFontWeight.semiBold,
                //       fontSize: CommonFontSizes.sp16.sp,
                //       color: AppColors.whiteColor,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
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
                                color: AppColors.whiteColor,
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
                                setState(() {
                                  donorPhoneLoginController
                                      .showVerificationSection.value = false;
                                  _otpController.text = '';
                                  donorPhoneLoginController.isOTPEntered.value =
                                      false;
                                });
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
                                    color:
                                        AppColors.blackColor.withOpacity(.5)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.w),
                                  borderSide: const BorderSide(
                                      color: AppColors.blackColor)),
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

                          // TextFormField(
                          //   autovalidateMode: AutovalidateMode.disabled,
                          //   inputFormatters: <TextInputFormatter>[
                          //     FilteringTextInputFormatter.allow(
                          //         RegExp("[0-9]")),
                          //   ],
                          //   validator: (value) {
                          //     if (value == "") {
                          //       return AppLocalizations.of(context)!
                          //           .phonerequired;
                          //     }
                          //     if (!RegExp("[0-9]").hasMatch(value!)) {
                          //       return AppLocalizations.of(context)!
                          //           .phoneNumberError;
                          //     }
                          //     if (value.length < 10) {
                          //       setState(() {
                          //         donorPhoneLoginController
                          //             .showVerificationSection.value = false;
                          //         _otpController.text = '';
                          //         donorPhoneLoginController.isOTPEntered.value =
                          //             false;
                          //       });
                          //       return AppLocalizations.of(context)!
                          //           .phoneNumberError;
                          //     }
                          //     FocusManager.instance.primaryFocus?.unfocus();
                          //     return null;
                          //   },
                          //   cursorColor: AppColors.blackColor,
                          //   controller: _phoneController,
                          //   maxLength: 10,
                          //   decoration: InputDecoration(
                          //     filled: true,
                          //     fillColor: AppColors.whiteColor,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(2.w),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(2.w),
                          //       borderSide: BorderSide(
                          //           color:
                          //               AppColors.blackColor.withOpacity(.5)),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(2.w),
                          //         borderSide: const BorderSide(
                          //             color: AppColors.blackColor)),
                          //     counterText: "",
                          //     contentPadding:
                          //         const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          //   ),
                          //   onChanged: (value) {
                          //     if (_formKey.currentState != null &&
                          //         _formKey.currentState!.validate()) {
                          //       return;
                          //     }
                          //   },
                          //   onFieldSubmitted: (value) {
                          //     if (_formKey.currentState!.validate()) {
                          //       print("yes");
                          //     }
                          //   },
                          //   style: CommonTextStyles.poppinsMediumStyle.copyWith(
                          //       color: AppColors.blackColor,
                          //       fontSize: CommonFontSizes.sp16.sp),
                          //   keyboardType: TextInputType.phone,
                          // ),

                          SizedBox(
                            height: 5.h,
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
                                  donorPhoneLoginController.sendPhoneCode(
                                      _selectedCountryCode,
                                      _phoneController.text);
                                }
                              }
                            },
                            buttonText: AppLocalizations.of(context)!.getCode,
                            textColor: AppColors.whiteColor,
                            fontWeight: CommonFontWeight.semiBold,
                          ),
                          // SizedBox(height: 4.h,),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: Container(
                    width: 100.w,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    // child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.rupatient,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: CommonFontWeight.semiBold,
                              fontSize: 16.sp,
                              color: AppColors.bgColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          AppLocalizations.of(context)!.morethan,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: CommonFontWeight.regular,
                            fontSize: 14.sp,
                            color: AppColors.bgColor,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.morethan2,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: CommonFontWeight.regular,
                            fontSize: 14.sp,
                            color: AppColors.bgColor,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.off(() => const Login());
                          },
                          child: Container(
                            width: 50.w,
                            height: 5.h,
                            decoration: const BoxDecoration(
                              color: AppColors.bgColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2)),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.yes,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: CommonFontWeight.semiBold,
                                  fontSize: 18.sp,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
