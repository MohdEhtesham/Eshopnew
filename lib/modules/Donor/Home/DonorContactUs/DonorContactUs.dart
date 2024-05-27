// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/modules/Donor/Home/DonorHomeController.dart';

// ignore: must_be_immutable
class DonorContactUs extends StatefulWidget {
  const DonorContactUs({
    super.key,
  });

  @override
  State<DonorContactUs> createState() => _DonorContactUsState();
}

class _DonorContactUsState extends State<DonorContactUs> {
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  var donorhomeController = Get.put(DonorHomeController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.bgColor,
            iconTheme: const IconThemeData(color: AppColors.primaryColor),
            titleSpacing: 10.0,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            leadingWidth: 50.0,
            title: Container(
              height: 10.h,
              width: 60.w,
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.contactus,
                style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                  fontSize: CommonFontSizes.sp18.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Container(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      width: 95.w,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 15.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocalizations.of(context)!.pleasecon,
                                    style: CommonTextStyles.poppinsRegularStyle
                                        .copyWith(
                                      fontSize: CommonFontSizes.sp18.sp,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                TextFormField(
                                  autovalidateMode: AutovalidateMode.disabled,
                                  validator: (value) {
                                    if (value == "") {
                                      return AppLocalizations.of(context)!
                                          .entersub;
                                    }

                                    return null;
                                  },
                                  cursorColor: AppColors.blackColor,
                                  controller: _subjectController,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintText:
                                        AppLocalizations.of(context)!.entersub,
                                    filled: true,
                                    fillColor: AppColors.whiteColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.w),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.w),
                                      borderSide: const BorderSide(
                                          color: AppColors.primaryColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.w),
                                        borderSide: const BorderSide(
                                            color: AppColors.primaryColor)),
                                    hintStyle: CommonTextStyles
                                        .poppinsMediumStyle
                                        .copyWith(
                                            color: AppColors.blackColor
                                                .withOpacity(.5),
                                            fontSize: CommonFontSizes.sp16.sp),
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  ),
                                  onChanged: (value) {
                                    if (_formKey.currentState!.validate()) {
                                      donorhomeController.isActiveButton.value =
                                          true;
                                    } else {
                                      donorhomeController.isActiveButton.value =
                                          false;
                                    }
                                  },
                                  onFieldSubmitted: (value) {
                                    if (_formKey.currentState!.validate()) {
                                      donorhomeController.isActiveButton.value =
                                          true;
                                    } else {
                                      donorhomeController.isActiveButton.value =
                                          false;
                                    }
                                  },
                                  style: CommonTextStyles.poppinsMediumStyle
                                      .copyWith(
                                          color: AppColors.blackColor,
                                          fontSize: CommonFontSizes.sp16.sp),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(height: 2.h),
                                SizedBox(
                                  height: 30.h,
                                  child: TextFormField(
                                    autovalidateMode: AutovalidateMode.disabled,
                                    validator: (value) {
                                      if (value == "") {
                                        return AppLocalizations.of(context)!
                                            .entermsg;
                                      }

                                      return null;
                                    },
                                    cursorColor: AppColors.blackColor,
                                    maxLines: 30,
                                    controller: _messageController,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      hintText: AppLocalizations.of(context)!
                                          .entermsg,
                                      filled: true,
                                      fillColor: AppColors.whiteColor,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.w),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.w),
                                        borderSide: const BorderSide(
                                            color: AppColors.primaryColor),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                          borderSide: const BorderSide(
                                              color: AppColors.primaryColor)),
                                      hintStyle: CommonTextStyles
                                          .poppinsMediumStyle
                                          .copyWith(
                                              color: AppColors.blackColor
                                                  .withOpacity(.5),
                                              fontSize:
                                                  CommonFontSizes.sp16.sp),
                                    ),
                                    textAlign: TextAlign.start,
                                    onChanged: (value) {
                                      if (_formKey.currentState!.validate()) {
                                        donorhomeController
                                            .isActiveButton.value = true;
                                      } else {
                                        donorhomeController
                                            .isActiveButton.value = false;
                                      }
                                    },
                                    onFieldSubmitted: (value) {
                                      if (_formKey.currentState!.validate()) {
                                        donorhomeController
                                            .isActiveButton.value = true;
                                      } else {
                                        donorhomeController
                                            .isActiveButton.value = false;
                                      }
                                    },
                                    style: CommonTextStyles.poppinsMediumStyle
                                        .copyWith(
                                            color: AppColors.blackColor,
                                            fontSize: CommonFontSizes.sp16.sp),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                CommonButton(
                                  width: 90.w,
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (_formKey.currentState!.validate()) {
                                      donorhomeController.contactUs(
                                          _subjectController.text,
                                          _messageController.text);
                                    }
                                  },
                                  buttonText:
                                      AppLocalizations.of(context)!.submit,
                                  buttonColor: AppColors.btnColor,
                                  textColor: AppColors.whiteColor,
                                  fontWeight: CommonFontWeight.semiBold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
