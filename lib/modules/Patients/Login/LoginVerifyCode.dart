import 'dart:async';

import 'package:eshop/modules/Patients/Home/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:eshop/modules/Patients/Login/PhoneLoginController.dart';

class LoginVerifyCode extends StatefulWidget {
  LoginVerifyCode({super.key, required this.phone});

  final String phone;

  @override
  State<LoginVerifyCode> createState() => _LoginVerifyCodeState();
}

class _LoginVerifyCodeState extends State<LoginVerifyCode> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  late PhoneLoginController phoneLoginVerifyCodeController;

  bool showResend = true;
  int countdown = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    phoneLoginVerifyCodeController = Get.put(PhoneLoginController());
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        timer.cancel();
        setState(() {
          showResend = false;
        });
      } else {
        setState(() {
          countdown--;
        });
      }
    });
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
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 4),
                  child: Image.asset(AppImages.splashLogo),
                ),
                SizedBox(
                  height: 4.h,
                ),
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
                              AppLocalizations.of(context)!.verification,
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
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .otprequired;
                              }
                              if (value.length < 6) {
                                return AppLocalizations.of(context)!.otpisless;
                              }
                              return null;
                            },
                            cursorColor: AppColors.blackColor,
                            controller: _otpController,
                            maxLength: 6,
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
                                borderSide:
                                    BorderSide(color: AppColors.bgColor),
                              ),
                              counterText: "", // Remove counter text
                              contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            ),
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                              fontSize: CommonFontSizes.sp16.sp,
                              color: AppColors.blackColor,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          showResend
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.resend,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.normal,
                                        fontSize: CommonFontSizes.sp16.sp,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    Text(
                                      "($countdown ${AppLocalizations.of(context)!.sec})",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.normal,
                                        fontSize: CommonFontSizes.sp16.sp,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showResend = true;
                                      countdown = 30;
                                    });
                                    startTimer();
                                    phoneLoginVerifyCodeController
                                        .resendCode(widget.phone);
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      AppLocalizations.of(context)!.resend,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.normal,
                                        fontSize: CommonFontSizes.sp16.sp,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 4.h,
                          ),
                          CommonButton(
                            width: 100.w,
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (_formKey.currentState!.validate()) {
                                // phoneLoginVerifyCodeController.verifyPhoneCode(
                                //     _otpController.text, widget.phone);
                                Get.to(() => const HomeScreen());
                                
                              }
                            },
                            buttonText: AppLocalizations.of(context)!.submit,
                            textColor: AppColors.whiteColor,
                            fontWeight: CommonFontWeight.semiBold,
                            buttonColor: AppColors.bgColor,
                          ),
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
  }
}
