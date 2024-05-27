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
import 'package:eshop/components/strings/Constants.dart';
import 'package:eshop/modules/Patients/Home/Application/ApplicationController.dart';
import 'package:eshop/modules/Patients/Home/Application/PatientInfoController.dart';
import 'package:eshop/modules/Patients/Home/Application/StepProgressView.dart';
import '../../../../components/CommonFunctions/CommonFunctions.dart' as common;

// ignore: must_be_immutable
class PatientInformation extends StatefulWidget {
  const PatientInformation({
    super.key,
  });

  @override
  State<PatientInformation> createState() => _PatientInformationState();
}

class _PatientInformationState extends State<PatientInformation> {
  var applicationController = Get.put(ApplicationController());
  var patientInfoController = Get.put(PatientInfoController());
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  List<String> _selectedLanguages = [];
  bool isButtonEnabled = false;
  bool isfilled = false;
  @override
  void initState() {
    super.initState();
    patientInfoController.getformStatus();
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
                                                  .patientinfo,
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
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 0),
                                          child: Center(
                                            child: Container(
                                              width: 80.w,
                                              color: AppColors.whiteColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
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
                                                            validator: (value) {
                                                              if (value == "" ||
                                                                  value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .nameisrequired;
                                                              }
                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                patientInfoController
                                                                    .nameController!,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .nameEdit,
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
                                                            onChanged: (value) {
                                                              // if (_formKey
                                                              //     .currentState!
                                                              //     .validate()) {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = true;
                                                              // } else {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = false;
                                                              // }
                                                            },
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
                                                                      .sp14.sp,
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                          ),
                                                          SizedBox(height: 2.h),
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            validator: (value) {
                                                              if (value == "" ||
                                                                  value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .addressisrequired;
                                                              }

                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                patientInfoController
                                                                    .address!,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .address,
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
                                                                borderSide: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(2
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
                                                              hintStyle: CommonTextStyles
                                                                  .poppinsMediumStyle
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .bgColor
                                                                          .withOpacity(
                                                                              .5),
                                                                      fontSize: CommonFontSizes
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
                                                            onChanged: (value) {
                                                              // if (_formKey
                                                              //     .currentState!
                                                              //     .validate()) {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = true;
                                                              // } else {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = false;
                                                              // }
                                                            },
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
                                                                            .sp),
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                          ),
                                                          SizedBox(height: 2.h),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 35.w,
                                                                child:
                                                                    TextFormField(
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .disabled,
                                                                  validator:
                                                                      (value) {
                                                                    if (value == "" ||
                                                                        value ==
                                                                            null ||
                                                                        value
                                                                            .trim()
                                                                            .isEmpty) {
                                                                      return AppLocalizations.of(
                                                                              context)!
                                                                          .citynameisrequired;
                                                                    }

                                                                    return null;
                                                                  },
                                                                  cursorColor:
                                                                      AppColors
                                                                          .blackColor,
                                                                  controller:
                                                                      patientInfoController
                                                                          .city!,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    counterText:
                                                                        "",
                                                                    labelText:
                                                                        AppLocalizations.of(context)!
                                                                            .city,
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        AppColors
                                                                            .whiteColor,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.w),
                                                                    ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.w),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: AppColors.primaryColor),
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(2
                                                                                .w),
                                                                        borderSide:
                                                                            const BorderSide(color: AppColors.primaryColor)),
                                                                    labelStyle: TextStyle(
                                                                        color: AppColors
                                                                            .bgColor,
                                                                        fontSize:
                                                                            CommonFontSizes.sp14),
                                                                    hintStyle: CommonTextStyles.poppinsMediumStyle.copyWith(
                                                                        color: AppColors
                                                                            .blackColor
                                                                            .withOpacity(
                                                                                .5),
                                                                        fontSize: CommonFontSizes
                                                                            .sp14
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
                                                                      (value) {
                                                                    // if (_formKey
                                                                    //     .currentState!
                                                                    //     .validate()) {
                                                                    //   applicationController
                                                                    //       .isActiveButton
                                                                    //       .value = true;
                                                                    // } else {
                                                                    //   applicationController
                                                                    //       .isActiveButton
                                                                    //       .value = false;
                                                                    // }
                                                                  },
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
                                                              ),
                                                              SizedBox(
                                                                  width: 1.w),
                                                              Container(
                                                                width: 35.w,
                                                                child:
                                                                    TextFormField(
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .disabled,
                                                                  validator:
                                                                      (value) {
                                                                    if (value == "" ||
                                                                        value ==
                                                                            null ||
                                                                        value
                                                                            .trim()
                                                                            .isEmpty) {
                                                                      return AppLocalizations.of(
                                                                              context)!
                                                                          .stateisrequired;
                                                                    }

                                                                    return null;
                                                                  },
                                                                  cursorColor:
                                                                      AppColors
                                                                          .blackColor,
                                                                  controller:
                                                                      patientInfoController
                                                                          .state!,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    counterText:
                                                                        "",
                                                                    labelText:
                                                                        AppLocalizations.of(context)!
                                                                            .state,
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        AppColors
                                                                            .whiteColor,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.w),
                                                                    ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2.w),
                                                                      borderSide:
                                                                          const BorderSide(
                                                                              color: AppColors.primaryColor),
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(2
                                                                                .w),
                                                                        borderSide:
                                                                            const BorderSide(color: AppColors.primaryColor)),
                                                                    labelStyle: TextStyle(
                                                                        color: AppColors
                                                                            .bgColor,
                                                                        fontSize:
                                                                            CommonFontSizes.sp14),
                                                                    hintStyle: CommonTextStyles.poppinsMediumStyle.copyWith(
                                                                        color: AppColors
                                                                            .blackColor
                                                                            .withOpacity(
                                                                                .5),
                                                                        fontSize: CommonFontSizes
                                                                            .sp14
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
                                                                      (value) {
                                                                    // if (_formKey
                                                                    //     .currentState!
                                                                    //     .validate()) {
                                                                    //   applicationController
                                                                    //       .isActiveButton
                                                                    //       .value = true;
                                                                    // } else {
                                                                    //   applicationController
                                                                    //       .isActiveButton
                                                                    //       .value = false;
                                                                    // }
                                                                  },
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
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 2.h),
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            validator: (value) {
                                                              if (value == "" ||
                                                                  value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .zipcodeisrequired;
                                                              }

                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                patientInfoController
                                                                    .zipcode!,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .zipcode,
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
                                                                borderSide: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(2
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
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .5),
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp14
                                                                          .sp),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      15,
                                                                      0,
                                                                      15,
                                                                      0),
                                                            ),
                                                            onChanged: (value) {
                                                              // if (_formKey
                                                              //     .currentState!
                                                              //     .validate()) {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = true;
                                                              // } else {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = false;
                                                              // }
                                                            },
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
                                                                            .sp),
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                          ),
                                                          SizedBox(height: 2.h),
                                                          TextFormField(
                                                            onTap: () async {
                                                              // showCustomDatePicker(100.h, 100.w);
                                                              DateTime?
                                                                  pickedDate =
                                                                  await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(), //get today's date
                                                                firstDate: DateTime(
                                                                    1900), //DateTime.now() - not to allow to choose before today.
                                                                lastDate:
                                                                    DateTime
                                                                        .now(),
                                                                builder:
                                                                    (context,
                                                                        child) {
                                                                  return Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      colorScheme: ColorScheme.light(
                                                                          primary: AppColors
                                                                              .bgColor,
                                                                          onPrimary:
                                                                              AppColors.whiteColor
                                                                          // onSurface: Colors.blueAccent, // <-- SEE HERE
                                                                          ),
                                                                      textButtonTheme:
                                                                          TextButtonThemeData(
                                                                        style: TextButton.styleFrom(
                                                                            foregroundColor:
                                                                                AppColors.bgColor),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        child!,
                                                                  );
                                                                },
                                                              );
                                                              applicationController
                                                                      .selectedDate
                                                                      .value =
                                                                  pickedDate!;
                                                              DateFormat
                                                                  dateFormat =
                                                                  DateFormat(
                                                                      "yyyy-MM-dd");

                                                              patientInfoController
                                                                      .dateofbirth
                                                                      .text =
                                                                  dateFormat
                                                                      .format(
                                                                          pickedDate)
                                                                      .toString();
                                                            },
                                                            validator: (value) {
                                                              if (value == "" ||
                                                                  value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .dateofbirthisrequired;
                                                              }
                                                              return null;
                                                            },
                                                            onChanged: (value) {
                                                              // if (_formKey
                                                              //     .currentState!
                                                              //     .validate()) {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = true;
                                                              // } else {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = false;
                                                              // }
                                                            },
                                                            // readOnly: true,
                                                            cursorColor:
                                                                AppColors
                                                                    .bgColor,
                                                            controller:
                                                                patientInfoController
                                                                    .dateofbirth!,
                                                            decoration:
                                                                InputDecoration(
                                                              helperText: "",
                                                              suffixIconConstraints:
                                                                  BoxConstraints(
                                                                maxHeight: 5.w,
                                                                maxWidth: 12.w,
                                                              ),
                                                              suffixIcon:
                                                                  Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            15.0),
                                                                child: Image(
                                                                  image: AssetImage(
                                                                      AppImages
                                                                          .calendar),
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .dateofbirth,
                                                              labelStyle: TextStyle(
                                                                  color: AppColors
                                                                      .bgColor,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp14),
                                                              hintStyle: CommonTextStyles
                                                                  .poppinsMediumStyle
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .bgColor,
                                                                      fontSize: CommonFontSizes
                                                                          .sp14
                                                                          .sp),
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
                                                                borderSide: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(2
                                                                              .w),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              AppColors.primaryColor)),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      15,
                                                                      0,
                                                                      15,
                                                                      0),
                                                            ),
                                                            style: CommonTextStyles
                                                                .poppinsRegularStyle
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp),
                                                          ),
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            validator: (value) {
                                                              if (value == "" ||
                                                                  value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .socialsecuritynorequired;
                                                              }

                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                patientInfoController
                                                                    .socialsecnumber!,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText: AppLocalizations
                                                                      .of(context)!
                                                                  .socialsecurityno,
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
                                                                borderSide: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(2
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
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .5),
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp14
                                                                          .sp),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      15,
                                                                      0,
                                                                      15,
                                                                      0),
                                                            ),
                                                            onChanged: (value) {
                                                              // if (_formKey.currentState !=
                                                              //         null &&
                                                              //     _formKey
                                                              //         .currentState!
                                                              //         .validate()) {
                                                              //   return;
                                                              // }
                                                            },
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
                                                                            .sp),
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                          ),
                                                          SizedBox(height: 2.h),
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            inputFormatters: <TextInputFormatter>[
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      "[0-9]")),
                                                            ],
                                                            validator: (value) {
                                                              if (value == "" ||
                                                                  value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .phonerequired;
                                                              }
                                                              if (!RegExp(
                                                                      "[0-9]")
                                                                  .hasMatch(
                                                                      value!)) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .phoneNumberError;
                                                              }
                                                              if (value.length <
                                                                  10) {
                                                                setState(() {});
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .phoneNumberError;
                                                              }
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                patientInfoController
                                                                    .phone!,
                                                            maxLength: 10,
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .phone,
                                                              labelStyle: TextStyle(
                                                                  color: AppColors
                                                                      .bgColor,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp14),
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
                                                                borderSide: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(2
                                                                              .w),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              AppColors.primaryColor)),
                                                              counterText: "",
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      15,
                                                                      0,
                                                                      15,
                                                                      0),
                                                            ),
                                                            onChanged: (value) {
                                                              // if (_formKey.currentState !=
                                                              //         null &&
                                                              //     _formKey
                                                              //         .currentState!
                                                              //         .validate()) {
                                                              //   return;
                                                              // }
                                                            },
                                                            onFieldSubmitted:
                                                                (value) {
                                                              // if (_formKey.currentState!.validate()) {
                                                              //   print("yes");
                                                              // }
                                                            },
                                                            style: CommonTextStyles
                                                                .poppinsMediumStyle
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp),
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                          ),
                                                          SizedBox(height: 2.h),
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            validator: (value) {
                                                              if (value == "" ||
                                                                  value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .cellisrequired;
                                                              }

                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                patientInfoController
                                                                    .cell!,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .cell,
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
                                                                borderSide: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(2
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
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .5),
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp14
                                                                          .sp),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      15,
                                                                      0,
                                                                      15,
                                                                      0),
                                                            ),
                                                            onChanged: (value) {
                                                              // if (_formKey
                                                              //     .currentState!
                                                              //     .validate()) {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = true;
                                                              // } else {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = false;
                                                              // }
                                                            },
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
                                                                            .sp),
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                          ),
                                                          SizedBox(height: 2.h),
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            validator: (value) {
                                                              // if (isSignupButtonActive) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .emailisrequired;
                                                              }
                                                              if (!RegExp(Constants
                                                                      .emailRegex)
                                                                  .hasMatch(
                                                                      value)) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .validemail;
                                                              }
                                                              return null;
                                                              // }
                                                            },
                                                            cursorColor:
                                                                const Color
                                                                    .fromRGBO(
                                                                    0, 0, 0, 1),
                                                            controller:
                                                                patientInfoController
                                                                    .email!,
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .emailp,
                                                              labelStyle: TextStyle(
                                                                  color: AppColors
                                                                      .bgColor,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp14),
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
                                                                borderSide: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(2
                                                                              .w),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              AppColors.primaryColor)),
                                                              counterText: "",
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
                                                                            .sp),
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                          ),
                                                          SizedBox(
                                                            height: 2.h,
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .gender,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    CommonFontWeight
                                                                        .semiBold,
                                                                fontSize:
                                                                    CommonFontSizes
                                                                        .sp16
                                                                        .sp,
                                                                color: AppColors
                                                                    .bgColor
                                                                    .withOpacity(
                                                                        .9),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Radio(
                                                                value: 0,
                                                                groupValue:
                                                                    applicationController
                                                                        .gender
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                        .gender
                                                                        .value = value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .male,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                              Radio(
                                                                value: 1,
                                                                groupValue:
                                                                    applicationController
                                                                        .gender
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                        .gender
                                                                        .value = value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .female,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            height: 2.h,
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    .2),
                                                            // Set the color of the underline
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .maritalstatus,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    CommonFontWeight
                                                                        .semiBold,
                                                                fontSize:
                                                                    CommonFontSizes
                                                                        .sp16
                                                                        .sp,
                                                                color: AppColors
                                                                    .bgColor
                                                                    .withOpacity(
                                                                        .9),
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Radio(
                                                                    value: 0,
                                                                    groupValue:
                                                                        applicationController
                                                                            .marital
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .marital
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .married,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                  Radio(
                                                                    value: 1,
                                                                    groupValue:
                                                                        applicationController
                                                                            .marital
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .marital
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .single,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                  Radio(
                                                                    value: 2,
                                                                    groupValue:
                                                                        applicationController
                                                                            .marital
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .marital
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .divorce,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Radio(
                                                                    value: 3,
                                                                    groupValue:
                                                                        applicationController
                                                                            .marital
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .marital
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .widow,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                  Radio(
                                                                    value: 4,
                                                                    groupValue:
                                                                        applicationController
                                                                            .marital
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .marital
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .separated,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            height: 2.h,
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    .2),
                                                            // Set the color of the underline
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .race,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    CommonFontWeight
                                                                        .semiBold,
                                                                fontSize:
                                                                    CommonFontSizes
                                                                        .sp16
                                                                        .sp,
                                                                color: AppColors
                                                                    .bgColor
                                                                    .withOpacity(
                                                                        .9),
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Radio(
                                                                    value: 0,
                                                                    groupValue:
                                                                        applicationController
                                                                            .race
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .race
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .white,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                  Radio(
                                                                    value: 1,
                                                                    groupValue:
                                                                        applicationController
                                                                            .race
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .race
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .black,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                  Radio(
                                                                    value: 2,
                                                                    groupValue:
                                                                        applicationController
                                                                            .race
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .race
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .asian,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Radio(
                                                                    value: 3,
                                                                    groupValue:
                                                                        applicationController
                                                                            .race
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .race
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .americanindian,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Radio(
                                                                    value: 4,
                                                                    groupValue:
                                                                        applicationController
                                                                            .race
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .race
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .hawaiian,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Radio(
                                                                    value: 5,
                                                                    groupValue:
                                                                        applicationController
                                                                            .race
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .race
                                                                            .value = value;
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        AppColors
                                                                            .bgColor,
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .other,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          CommonFontWeight
                                                                              .semiBold,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp12
                                                                              .sp,
                                                                      color: AppColors
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              .9),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            height: 2.h,
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    .2),
                                                            // Set the color of the underline
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .hispanicOrigin,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    CommonFontWeight
                                                                        .semiBold,
                                                                fontSize:
                                                                    CommonFontSizes
                                                                        .sp16
                                                                        .sp,
                                                                color: AppColors
                                                                    .bgColor
                                                                    .withOpacity(
                                                                        .9),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Radio(
                                                                value: 0,
                                                                groupValue:
                                                                    applicationController
                                                                        .hispanic
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                        .hispanic
                                                                        .value = value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .yes,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                              Radio(
                                                                value: 1,
                                                                groupValue:
                                                                    applicationController
                                                                        .hispanic
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                        .hispanic
                                                                        .value = value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .no,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            height: 2.h,
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    .2),
                                                            // Set the color of the underline
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .uscitizen,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    CommonFontWeight
                                                                        .semiBold,
                                                                fontSize:
                                                                    CommonFontSizes
                                                                        .sp16
                                                                        .sp,
                                                                color: AppColors
                                                                    .bgColor
                                                                    .withOpacity(
                                                                        .9),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Radio(
                                                                value: 0,
                                                                groupValue:
                                                                    applicationController
                                                                        .uscitizen
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                        .uscitizen
                                                                        .value = value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .yes,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                              Radio(
                                                                value: 1,
                                                                groupValue:
                                                                    applicationController
                                                                        .uscitizen
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                        .uscitizen
                                                                        .value = value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .no,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            height: 2.h,
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    .2),
                                                            // Set the color of the underline
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .usresident,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    CommonFontWeight
                                                                        .semiBold,
                                                                fontSize:
                                                                    CommonFontSizes
                                                                        .sp16
                                                                        .sp,
                                                                color: AppColors
                                                                    .bgColor
                                                                    .withOpacity(
                                                                        .9),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Radio(
                                                                value: 0,
                                                                groupValue:
                                                                    applicationController
                                                                        .usresident
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                        .usresident
                                                                        .value = value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .yes,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                              Radio(
                                                                value: 1,
                                                                groupValue:
                                                                    applicationController
                                                                        .usresident
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                        .usresident
                                                                        .value = value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .no,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            height: 2.h,
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    .2),
                                                            // Set the color of the underline
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .douspeakenglish,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontWeight:
                                                                    CommonFontWeight
                                                                        .semiBold,
                                                                fontSize:
                                                                    CommonFontSizes
                                                                        .sp16
                                                                        .sp,
                                                                color: AppColors
                                                                    .bgColor
                                                                    .withOpacity(
                                                                        .9),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Radio(
                                                                value: 0,
                                                                groupValue:
                                                                    applicationController
                                                                        .speak
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                            .speak
                                                                            .value =
                                                                        value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .yes,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                              Radio(
                                                                value: 1,
                                                                groupValue:
                                                                    applicationController
                                                                        .speak
                                                                        .value,
                                                                onChanged: (int?
                                                                    value) {
                                                                  if (value !=
                                                                      null) {
                                                                    applicationController
                                                                            .speak
                                                                            .value =
                                                                        value;
                                                                  }
                                                                },
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor,
                                                              ),
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .no,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontWeight:
                                                                      CommonFontWeight
                                                                          .semiBold,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12
                                                                          .sp,
                                                                  color: AppColors
                                                                      .blackColor
                                                                      .withOpacity(
                                                                          .9),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          DropdownButtonFormField<
                                                              String>(
                                                            items: [
                                                              DropdownMenuItem<
                                                                  String>(
                                                                child: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .english),
                                                                value: AppLocalizations.of(
                                                                        context)!
                                                                    .english,
                                                              ),
                                                              DropdownMenuItem<
                                                                  String>(
                                                                child: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .spanish,
                                                                ),
                                                                value: AppLocalizations.of(
                                                                        context)!
                                                                    .spanish,
                                                              ),
                                                            ],
                                                            onChanged: (value) {
                                                              setState(() {
                                                                if (!_selectedLanguages
                                                                    .contains(
                                                                        value)) {
                                                                  _selectedLanguages
                                                                      .add(
                                                                          value!);
                                                                }
                                                              });
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                              labelText: AppLocalizations
                                                                      .of(context)!
                                                                  .languagepref,
                                                              labelStyle: TextStyle(
                                                                  color: AppColors
                                                                      .bgColor,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp14),
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
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      15,
                                                                      0,
                                                                      15,
                                                                      0),
                                                              hintText: _selectedLanguages
                                                                      .isNotEmpty
                                                                  ? _selectedLanguages
                                                                      .join(
                                                                          ', ')
                                                                  : 'Select Languages',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2.h,
                                                          ),
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            validator: (value) {
                                                              if (value == "" ||
                                                                  value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .emergencynamerequied;
                                                              }
                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                patientInfoController
                                                                    .emergencyname!,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText: AppLocalizations
                                                                      .of(context)!
                                                                  .emergancyname,
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
                                                            onChanged: (value) {
                                                              // if (_formKey
                                                              //     .currentState!
                                                              //     .validate()) {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = true;
                                                              // } else {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = false;
                                                              // }
                                                            },
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
                                                                      .sp14.sp,
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                          ),
                                                          SizedBox(height: 2.h),
                                                          TextFormField(
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            validator: (value) {
                                                              if (value == "" ||
                                                                  value ==
                                                                      null ||
                                                                  value
                                                                      .trim()
                                                                      .isEmpty) {
                                                                return AppLocalizations.of(
                                                                        context)!
                                                                    .emergencycontactrquired;
                                                              }
                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                patientInfoController
                                                                    .emergencycontact!,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText: AppLocalizations
                                                                      .of(context)!
                                                                  .emergencycontact,
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
                                                            onChanged: (value) {
                                                              // if (_formKey
                                                              //     .currentState!
                                                              //     .validate()) {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = true;
                                                              // } else {
                                                              //   applicationController
                                                              //       .isActiveButton
                                                              //       .value = false;
                                                              // }
                                                            },
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
                                                                      .sp14.sp,
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                          ),
                                                          SizedBox(height: 2.h),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Container(
                                          height: 10.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.whiteColor,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
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
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            AppImages.form),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Container(
                                                    height: 6.h,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .medicalinfo,
                                                      style: CommonTextStyles
                                                          .poppinsSemiBoldStyle
                                                          .copyWith(
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp16.sp,
                                                        color: AppColors
                                                            .blackColor,
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
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          child: Center(
                                            child: Container(
                                              width: 80.w,
                                              color: AppColors.whiteColor,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Form(
                                                  key: _formKey1,
                                                  child: Column(
                                                    children: [
                                                      TextFormField(
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .disabled,
                                                        validator: (value) {
                                                          if (value == "" ||
                                                              value == null ||
                                                              value
                                                                  .trim()
                                                                  .isEmpty) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .medicareidisrequired;
                                                          }
                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        controller:
                                                            patientInfoController
                                                                .medicareid!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .medicareidtext,
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
                                                                    .sp16.sp,
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  15, 0, 15, 0),
                                                        ),
                                                        onChanged: (value) {
                                                          // if (_formKey1.currentState!
                                                          //     .validate()) {
                                                          //   applicationController
                                                          //       .isActiveButton.value = true;
                                                          // } else {
                                                          //   applicationController
                                                          //       .isActiveButton.value = false;
                                                          // }
                                                        },
                                                        onFieldSubmitted:
                                                            (value) {
                                                          if (_formKey1
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
                                                                  .sp14.sp,
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                      ),
                                                      SizedBox(height: 2.h),
                                                      TextFormField(
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .disabled,
                                                        validator: (value) {
                                                          if (value == "" ||
                                                              value == null ||
                                                              value
                                                                  .trim()
                                                                  .isEmpty) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .medicaididisrequied;
                                                          }
                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        controller:
                                                            patientInfoController
                                                                .medicaidid!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .medicaididtext,
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
                                                            borderSide: const BorderSide(
                                                                color: AppColors
                                                                    .primaryColor),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.w),
                                                              borderSide: const BorderSide(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          17,
                                                                          79,
                                                                          79,
                                                                          1))),
                                                          labelStyle: TextStyle(
                                                              color: AppColors
                                                                  .bgColor,
                                                              fontSize:
                                                                  CommonFontSizes
                                                                      .sp14),
                                                          hintStyle: CommonTextStyles
                                                              .poppinsMediumStyle
                                                              .copyWith(
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
                                                                  15, 0, 15, 0),
                                                        ),
                                                        onChanged: (value) {
                                                          // if (_formKey1.currentState!
                                                          //     .validate()) {
                                                          //   applicationController
                                                          //       .isActiveButton.value = true;
                                                          // } else {
                                                          //   applicationController
                                                          //       .isActiveButton.value = false;
                                                          // }
                                                        },
                                                        onFieldSubmitted:
                                                            (value) {
                                                          if (_formKey1
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
                                                                        .sp),
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                      ),
                                                      SizedBox(height: 2.h),
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
                                        // applicationController.saveApplication(
                                        //     patientInfoController.nameController.text,
                                        //     patientInfoController.city.text,
                                        //     patientInfoController.state.text,
                                        //     patientInfoController.zipcode.text,
                                        //     patientInfoController.socialsecnumber.text,
                                        //     patientInfoController.dateofbirth.text,
                                        //     patientInfoController.phone.text,
                                        //     patientInfoController.cell.text,
                                        //     patientInfoController.email.text,
                                        //   patientInfoController.emergencycontact.text);
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
                                                .validate()) {
                                          //   applicationController.saveApplication(
                                          //       patientInfoController.nameController.text,
                                          //       patientInfoController.city.text,
                                          //       patientInfoController.state.text,
                                          //       patientInfoController.zipcode.text,
                                          //       patientInfoController.socialsecnumber.text,
                                          //       patientInfoController.dateofbirth.text,
                                          //       patientInfoController.phone.text,
                                          //       patientInfoController.cell.text,
                                          //       patientInfoController.email.text,
                                          //     patientInfoController.emergencycontact.text);
                                        }
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
