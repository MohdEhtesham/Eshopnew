import 'package:flutter/material.dart';
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
class CancerScreenings extends StatefulWidget {
  const CancerScreenings({
    super.key,
  });

  @override
  State<CancerScreenings> createState() => _CancerScreeningsState();
}

class _CancerScreeningsState extends State<CancerScreenings> {
  var applicationController = Get.put(ApplicationController());

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

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
                                                  .cancerScreening,
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
                                                          Container(
                                                            height: 2.h,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .papSmear,
                                                              style: CommonTextStyles
                                                                  .poppinsSemiBoldStyle
                                                                  .copyWith(
                                                                fontSize:
                                                                    CommonFontSizes
                                                                        .sp16
                                                                        .sp,
                                                                color: AppColors
                                                                    .blackColor,
                                                              ),
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
                                                                    .typeisre;
                                                              }
                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            // controller:
                                                            //    patientInfoController.nameController!,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .type,
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
                                                          SizedBox(height: 3.h),
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

                                                              var patientInfoController;
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
                                                                    .dateisre;
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
                                                            // controller:
                                                            //     referringPhyController
                                                            //         .dateoflisted!,
                                                            decoration:
                                                                InputDecoration(
                                                              helperText: "",
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .when,
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
                                                                    .placeisre;
                                                              }

                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            // controller:,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .where,
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
                                                          SizedBox(height: 3.h),
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
                                                                    .pleaseUpload;
                                                              }

                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            // controller:
                                                            //     patientInfoController
                                                            //         .address!,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .uploadsre,
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
                                                      Container(
                                                        height: 2.h,
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .mammogram,
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
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
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
                                                                .typeisre;
                                                          }
                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        // controller:
                                                        //    patientInfoController.nameController!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .type,
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
                                                      SizedBox(height: 3.h),
                                                      TextFormField(
                                                        onTap: () async {
                                                          // showCustomDatePicker(100.h, 100.w);
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate: DateTime
                                                                .now(), //get today's date
                                                            firstDate: DateTime(
                                                                1900), //DateTime.now() - not to allow to choose before today.
                                                            lastDate:
                                                                DateTime.now(),
                                                            builder: (context,
                                                                child) {
                                                              return Theme(
                                                                data: Theme.of(
                                                                        context)
                                                                    .copyWith(
                                                                  colorScheme: ColorScheme.light(
                                                                      primary:
                                                                          AppColors
                                                                              .bgColor,
                                                                      onPrimary:
                                                                          AppColors
                                                                              .whiteColor
                                                                      // onSurface: Colors.blueAccent, // <-- SEE HERE
                                                                      ),
                                                                  textButtonTheme:
                                                                      TextButtonThemeData(
                                                                    style: TextButton.styleFrom(
                                                                        foregroundColor:
                                                                            AppColors.bgColor),
                                                                  ),
                                                                ),
                                                                child: child!,
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

                                                          var patientInfoController;
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
                                                              value == null ||
                                                              value
                                                                  .trim()
                                                                  .isEmpty) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .dateisre;
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
                                                            AppColors.bgColor,
                                                        // controller:
                                                        //     referringPhyController
                                                        //         .dateoflisted!,
                                                        decoration:
                                                            InputDecoration(
                                                          helperText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .when,
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
                                                                  fontSize:
                                                                      CommonFontSizes
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
                                                                      .circular(
                                                                          2.w),
                                                              borderSide: const BorderSide(
                                                                  color: AppColors
                                                                      .primaryColor)),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  15, 0, 15, 0),
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
                                                              value == null ||
                                                              value
                                                                  .trim()
                                                                  .isEmpty) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .placeisre;
                                                          }

                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        // controller:
                                                        //     patientInfoController
                                                        //         .address!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .where,
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
                                                                  color: AppColors
                                                                      .primaryColor)),
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
                                                        onChanged: (value) {},
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
                                                      SizedBox(height: 3.h),
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
                                                                .pleaseUpload;
                                                          }

                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        // controller:
                                                        //     patientInfoController
                                                        //         .address!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .uploadsre,
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
                                                                  color: AppColors
                                                                      .primaryColor)),
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
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
                                                  key: _formKey2,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 2.h,
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .colonoscopy,
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
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
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
                                                                .typeisre;
                                                          }
                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        // controller:
                                                        //    patientInfoController.nameController!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .type,
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
                                                      SizedBox(height: 3.h),
                                                      TextFormField(
                                                        onTap: () async {
                                                          // showCustomDatePicker(100.h, 100.w);
                                                          DateTime? pickedDate =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate: DateTime
                                                                .now(), //get today's date
                                                            firstDate: DateTime(
                                                                1900), //DateTime.now() - not to allow to choose before today.
                                                            lastDate:
                                                                DateTime.now(),
                                                            builder: (context,
                                                                child) {
                                                              return Theme(
                                                                data: Theme.of(
                                                                        context)
                                                                    .copyWith(
                                                                  colorScheme: ColorScheme.light(
                                                                      primary:
                                                                          AppColors
                                                                              .bgColor,
                                                                      onPrimary:
                                                                          AppColors
                                                                              .whiteColor
                                                                      // onSurface: Colors.blueAccent, // <-- SEE HERE
                                                                      ),
                                                                  textButtonTheme:
                                                                      TextButtonThemeData(
                                                                    style: TextButton.styleFrom(
                                                                        foregroundColor:
                                                                            AppColors.bgColor),
                                                                  ),
                                                                ),
                                                                child: child!,
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

                                                          var patientInfoController;
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
                                                              value == null ||
                                                              value
                                                                  .trim()
                                                                  .isEmpty) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .dateisre;
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
                                                            AppColors.bgColor,
                                                        // controller:
                                                        //     referringPhyController
                                                        //         .dateoflisted!,
                                                        decoration:
                                                            InputDecoration(
                                                          helperText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .when,
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
                                                                  fontSize:
                                                                      CommonFontSizes
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
                                                                      .circular(
                                                                          2.w),
                                                              borderSide: const BorderSide(
                                                                  color: AppColors
                                                                      .primaryColor)),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  15, 0, 15, 0),
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
                                                              value == null ||
                                                              value
                                                                  .trim()
                                                                  .isEmpty) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .placeisre;
                                                          }

                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        // controller:
                                                        //     patientInfoController
                                                        //         .address!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .where,
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
                                                                  color: AppColors
                                                                      .primaryColor)),
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
                                                        onChanged: (value) {},
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
                                                      SizedBox(height: 3.h),
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
                                                                .pleaseUpload;
                                                          }

                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        // controller:
                                                        //     patientInfoController
                                                        //         .address!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .uploadsre,
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
                                                                  color: AppColors
                                                                      .primaryColor)),
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
