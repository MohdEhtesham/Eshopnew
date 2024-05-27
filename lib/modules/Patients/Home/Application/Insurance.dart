// ignore_for_file: file_names
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
class Insurance extends StatefulWidget {
  const Insurance({
    super.key,
  });

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  final _nameController = TextEditingController();
  final _companyName = TextEditingController();
  final _policyNumber = TextEditingController();
  final _dateofbirth = TextEditingController();
  final _socialsecnumber = TextEditingController();
  final _phone = TextEditingController();
  final _groupNumber = TextEditingController();
  var applicationController = Get.put(ApplicationController());
  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;
  bool isfilled = false;

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
                AppLocalizations.of(context)!.application,
                style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                  fontSize: CommonFontSizes.sp18.sp,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Obx(
              () => SafeArea(
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
                                    currentProgress: .2,
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
                                                  .insuranceinfo,
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
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              "${AppLocalizations.of(context)!.insurancepremiumspaidby}: ",
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
                                                                            .premiumspaid
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .premiumspaid
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
                                                                        .self,
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
                                                                            .premiumspaid
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .premiumspaid
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
                                                                        .employer,
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
                                                                    value: 2,
                                                                    groupValue:
                                                                        applicationController
                                                                            .premiumspaid
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .premiumspaid
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
                                                                        .dialysiscenter,
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
                                                                            .premiumspaid
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .premiumspaid
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
                                                                        .americanKidneyfund,
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
                                                                            .premiumspaid
                                                                            .value,
                                                                    onChanged: (int?
                                                                        value) {
                                                                      if (value !=
                                                                          null) {
                                                                        applicationController
                                                                            .premiumspaid
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
                                                                _nameController,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText: AppLocalizations
                                                                      .of(context)!
                                                                  .pripolicyholdername,
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
                                                                    .insurancecompanyrequired;
                                                              }

                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                _companyName,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText: AppLocalizations
                                                                      .of(context)!
                                                                  .insurancecompany,
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
                                                                    .policyidrequired;
                                                              }

                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                _policyNumber,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText:
                                                                  "${AppLocalizations.of(context)!.policyId}.",
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
                                                                      "dd/MM/yyyy");
                                                              _dateofbirth
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
                                                              // if (_formKey.currentState!.validate()) {
                                                              //   signUpController.isVerifyButtonActive.value = true;
                                                              // } else {
                                                              //   signUpController.isVerifyButtonActive.value = false;
                                                              // }
                                                            },
                                                            // readOnly: true,
                                                            cursorColor:
                                                                AppColors
                                                                    .bgColor,
                                                            controller:
                                                                _dateofbirth,
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
                                                          // SizedBox(height:2.h),
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
                                                            maxLength: 10,
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                _socialsecnumber,
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
                                                                    .customerserviceNorequired;
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
                                                            controller: _phone,
                                                            maxLength: 10,
                                                            decoration:
                                                                InputDecoration(
                                                              filled: true,
                                                              labelText: AppLocalizations
                                                                      .of(context)!
                                                                  .customerserviceNo,
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
                                                              if (_formKey.currentState !=
                                                                      null &&
                                                                  _formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }
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
                                                                    .groupnumderrequired;
                                                              }

                                                              return null;
                                                            },
                                                            cursorColor:
                                                                AppColors
                                                                    .blackColor,
                                                            controller:
                                                                _groupNumber,
                                                            maxLength: 10,
                                                            decoration:
                                                                InputDecoration(
                                                              counterText: "",
                                                              labelText:
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .groupnumder,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ],
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
                                        if (_formKey.currentState!
                                            .validate()) {}
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
                                        if (_formKey.currentState!
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
