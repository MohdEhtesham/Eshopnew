import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/modules/Patients/Home/Application/ApplicationController.dart';
import 'package:eshop/modules/Patients/Home/Application/StepProgressView.dart';
import '../../../../components/CommonFunctions/CommonFunctions.dart' as common;

// ignore: must_be_immutable
class Medications extends StatefulWidget {
  const Medications({
    super.key,
  });

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  var applicationController = Get.put(ApplicationController());

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  bool isButtonEnabled = false;
  bool isfilled = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                AppLocalizations.of(context)!.application,
                style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                  fontSize: CommonFontSizes.sp18.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            centerTitle: true,
          ),
          body: Obx(
            () => SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: AppColors.whiteColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: 90.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  child: StepProgressView(
                                    currentProgress: applicationController!
                                        .percentage!.value!,
                                    totalSteps: 10,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: AppColors.whiteColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 5.h,
                                            width: 6.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                    AssetImage(AppImages.form),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Container(
                                            height: 6.h,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .medication,
                                              style: CommonTextStyles
                                                  .poppinsSemiBoldStyle
                                                  .copyWith(
                                                fontSize:
                                                    CommonFontSizes.sp16.sp,
                                                color: AppColors.blackColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  height: 62.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.bgColor.withOpacity(.2),
                                    border: Border.all(
                                      color:
                                          AppColors.whiteColor.withOpacity(.2),
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    // color: Colors.red,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            child: Center(
                                              child: Container(
                                                width: 80.w,
                                                color: AppColors.whiteColor,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: ListView(
                                                    physics: ScrollPhysics(),
                                                    shrinkWrap: true,
                                                    children: [
                                                      Form(
                                                        key: _formKey,
                                                        child: Column(
                                                          children: [
                                                            TextFormField(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .disabled,
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        "" ||
                                                                    value ==
                                                                        null ||
                                                                    value
                                                                        .trim()
                                                                        .isEmpty) {
                                                                  return AppLocalizations.of(
                                                                          context)!
                                                                      .medicationNameisre;
                                                                }
                                                                return null;
                                                              },
                                                              cursorColor:
                                                                  AppColors
                                                                      .blackColor,
                                                              // controller:

                                                              //         .nameController!,
                                                              decoration:
                                                                  InputDecoration(
                                                                counterText: "",
                                                                labelText: AppLocalizations.of(
                                                                        context)!
                                                                    .medicationName,
                                                                filled: true,
                                                                fillColor: AppColors
                                                                    .whiteColor,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.w),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.w),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.w),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                                labelStyle: TextStyle(
                                                                    color: AppColors
                                                                        .bgColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14),
                                                                hintStyle:
                                                                    CommonTextStyles
                                                                        .poppinsMediumStyle
                                                                        .copyWith(
                                                                  color: AppColors
                                                                      .bgColor
                                                                      .withOpacity(
                                                                          .5),
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp16
                                                                          .sp,
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        15,
                                                                        0,
                                                                        15,
                                                                        0),
                                                              ),
                                                              onChanged:
                                                                  (value) {},
                                                              onFieldSubmitted:
                                                                  (value) {
                                                                if (_formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  applicationController
                                                                      .isActiveButton
                                                                      .value = true;
                                                                } else {
                                                                  applicationController
                                                                      .isActiveButton
                                                                      .value = false;
                                                                }
                                                              },
                                                              style: CommonTextStyles
                                                                  .poppinsMediumStyle
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .blackColor,
                                                                fontSize:
                                                                    CommonFontSizes
                                                                        .sp14
                                                                        .sp,
                                                              ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                            ),
                                                            SizedBox(
                                                                height: 2.h),
                                                            TextFormField(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .disabled,
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        "" ||
                                                                    value ==
                                                                        null ||
                                                                    value
                                                                        .trim()
                                                                        .isEmpty) {
                                                                  return AppLocalizations.of(
                                                                          context)!
                                                                      .doseisrequired;
                                                                }

                                                                return null;
                                                              },
                                                              cursorColor:
                                                                  AppColors
                                                                      .blackColor,
                                                              // controller:
                                                              //     MedicationsController
                                                              // .address!,
                                                              decoration:
                                                                  InputDecoration(
                                                                counterText: "",
                                                                labelText:
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .dose,
                                                                filled: true,
                                                                fillColor: AppColors
                                                                    .whiteColor,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.w),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.w),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              AppColors.primaryColor),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(2
                                                                            .w),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                AppColors.primaryColor)),
                                                                labelStyle: TextStyle(
                                                                    color: AppColors
                                                                        .bgColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14),
                                                                hintStyle: CommonTextStyles.poppinsMediumStyle.copyWith(
                                                                    color: AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .5),
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        15,
                                                                        0,
                                                                        15,
                                                                        0),
                                                              ),
                                                              onChanged:
                                                                  (value) {},
                                                              onFieldSubmitted:
                                                                  (value) {
                                                                if (_formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  applicationController
                                                                      .isActiveButton
                                                                      .value = true;
                                                                } else {
                                                                  applicationController
                                                                      .isActiveButton
                                                                      .value = false;
                                                                }
                                                              },
                                                              style: CommonTextStyles
                                                                  .poppinsMediumStyle
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .blackColor,
                                                                      fontSize: CommonFontSizes
                                                                          .sp14
                                                                          .sp),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                            ),
                                                            SizedBox(
                                                                height: 2.h),
                                                            TextFormField(
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .disabled,
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        "" ||
                                                                    value ==
                                                                        null ||
                                                                    value
                                                                        .trim()
                                                                        .isEmpty) {
                                                                  return AppLocalizations.of(
                                                                          context)!
                                                                      .frequencyisrequired;
                                                                }

                                                                return null;
                                                              },
                                                              cursorColor:
                                                                  AppColors
                                                                      .blackColor,
                                                              // controller:
                                                              //     MedicationsController
                                                              // .address!,
                                                              decoration:
                                                                  InputDecoration(
                                                                counterText: "",
                                                                labelText: AppLocalizations.of(
                                                                        context)!
                                                                    .frequency,
                                                                filled: true,
                                                                fillColor: AppColors
                                                                    .whiteColor,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.w),
                                                                ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              2.w),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              AppColors.primaryColor),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(2
                                                                            .w),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                AppColors.primaryColor)),
                                                                labelStyle: TextStyle(
                                                                    color: AppColors
                                                                        .bgColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14),
                                                                hintStyle: CommonTextStyles.poppinsMediumStyle.copyWith(
                                                                    color: AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .5),
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        15,
                                                                        0,
                                                                        15,
                                                                        0),
                                                              ),
                                                              onChanged:
                                                                  (value) {},
                                                              onFieldSubmitted:
                                                                  (value) {
                                                                if (_formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  applicationController
                                                                      .isActiveButton
                                                                      .value = true;
                                                                } else {
                                                                  applicationController
                                                                      .isActiveButton
                                                                      .value = false;
                                                                }
                                                              },
                                                              style: CommonTextStyles
                                                                  .poppinsMediumStyle
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .blackColor,
                                                                      fontSize: CommonFontSizes
                                                                          .sp14
                                                                          .sp),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    CommonButton(
                                      onPressed: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        common.showCustomSnackBar(
                                            "${AppLocalizations.of(context)!.workinprogress}");
                                      },
                                      width: 42.w,
                                      buttonText:
                                          AppLocalizations.of(context)!.save,
                                      buttonColor: AppColors.whiteColor,
                                      textColor: AppColors.btnColor,
                                      borderColor: AppColors.btnColor,
                                      fontWeight: CommonFontWeight.semiBold,
                                      borderRadius: 0,
                                    ),
                                    const Spacer(),
                                    CommonButton(
                                      onPressed: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        common.showCustomSnackBar(
                                            "${AppLocalizations.of(context)!.workinprogress}");
                                        if (_formKey.currentState!.validate() &&
                                            _formKey1.currentState!
                                                .validate()) {}
                                      },
                                      width: 42.w,
                                      buttonText:
                                          AppLocalizations.of(context)!.next,
                                      fontWeight: CommonFontWeight.semiBold,
                                      borderRadius: 0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
