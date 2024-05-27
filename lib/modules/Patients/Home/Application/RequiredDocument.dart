// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/modules/Patients/Home/Application/ApplicationController.dart';
import 'package:eshop/modules/Patients/Home/Application/DashedReactBorder.dart';
import 'package:eshop/modules/Patients/Home/Application/StepProgressView.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../components/CommonFunctions/CommonFunctions.dart' as common;

// ignore: must_be_immutable
class RequiredDocuments extends StatefulWidget {
  const RequiredDocuments({
    super.key,
  });

  @override
  State<RequiredDocuments> createState() => _RequiredDocumentsState();
}

class _RequiredDocumentsState extends State<RequiredDocuments> {
  var applicationController = Get.put(ApplicationController());
  final _formKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;
  bool isfilled = false;
  String? unit;
  String? weightUnit;
  FilePickerResult? result;

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
            child: SafeArea(
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
                                              image: AssetImage(AppImages.form),
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
                                                .requiredDocuments,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp16.sp,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 5.h,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .requiredDocuments,
                                  style: CommonTextStyles.poppinsSemiBoldStyle
                                      .copyWith(
                                    fontSize: CommonFontSizes.sp16.sp,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                              Container(
                                height: 59.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Container(
                                          color: AppColors.whiteColor,
                                          child: ListView(
                                            physics: ScrollPhysics(),
                                            shrinkWrap: true,
                                            children: [
                                              Form(
                                                key: _formKey,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async {
                                                          result =
                                                              await FilePicker
                                                                  .platform
                                                                  .pickFiles();
                                                          if (result == null) {
                                                            print(
                                                                "No file selected");
                                                          } else {
                                                            setState(() {});
                                                            for (var element
                                                                in result!
                                                                    .files) {
                                                              print(
                                                                  element.name);
                                                            }
                                                          }
                                                        },
                                                        child: DashedRectBorder(
                                                          color:
                                                              AppColors.bgColor,
                                                          strokeWidth: 1,
                                                          gapWidth: 6,
                                                          dashWidth: 5,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Container(
                                                            width: 100.w,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              child: Column(
                                                                children: [
                                                                  Center(
                                                                    child: Image.asset(
                                                                        AppImages
                                                                            .upload),
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .drivinglicenced,
                                                                    style: CommonTextStyles
                                                                        .poppinsSemiBoldStyle
                                                                        .copyWith(
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp16
                                                                              .sp,
                                                                      color: AppColors
                                                                          .slightlyGrey,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .accepted,
                                                                    style: CommonTextStyles
                                                                        .poppinsSemiBoldStyle
                                                                        .copyWith(
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp14
                                                                              .sp,
                                                                      color: AppColors
                                                                          .slightlyGrey,
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
                                                      DashedRectBorder(
                                                        color:
                                                            AppColors.bgColor,
                                                        strokeWidth: 1,
                                                        gapWidth: 3,
                                                        dashWidth: 5,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              children: [
                                                                Center(
                                                                  child: Image.asset(
                                                                      AppImages
                                                                          .upload),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .insurancecardfront,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .accepted,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      DashedRectBorder(
                                                        color: AppColors
                                                            .bgColor, // Choose the color you want for the border
                                                        strokeWidth:
                                                            1, // Adjust the width as needed
                                                        gapWidth:
                                                            3, // Adjust the space between dashes as needed
                                                        dashWidth:
                                                            5, // Adjust the dash width as needed
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20), // Adjust the border radius as needed
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              children: [
                                                                Center(
                                                                  child: Image.asset(
                                                                      AppImages
                                                                          .upload),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .insurancecardback,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .accepted,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      DashedRectBorder(
                                                        color:
                                                            AppColors.bgColor,
                                                        strokeWidth: 1,
                                                        gapWidth: 3,
                                                        dashWidth: 5,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              children: [
                                                                Center(
                                                                  child: Image.asset(
                                                                      AppImages
                                                                          .upload),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .historynPfN,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .accepted,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      DashedRectBorder(
                                                        color: AppColors
                                                            .bgColor, // Choose the color you want for the border
                                                        strokeWidth:
                                                            1, // Adjust the width as needed
                                                        gapWidth:
                                                            3, // Adjust the space between dashes as needed
                                                        dashWidth:
                                                            5, // Adjust the dash width as needed
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20), // Adjust the border radius as needed
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              children: [
                                                                Center(
                                                                  child: Image.asset(
                                                                      AppImages
                                                                          .upload),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .hNWfNephrologist,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .dialysiscenter,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .accepted,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      DashedRectBorder(
                                                        color:
                                                            AppColors.bgColor,
                                                        strokeWidth: 1,
                                                        gapWidth: 3,
                                                        dashWidth: 5,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              children: [
                                                                Center(
                                                                  child: Image.asset(
                                                                      AppImages
                                                                          .upload),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .historyofCompliance,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .accepted,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      DashedRectBorder(
                                                        color:
                                                            AppColors.bgColor,
                                                        strokeWidth: 1,
                                                        gapWidth: 3,
                                                        dashWidth: 5,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              children: [
                                                                Center(
                                                                  child: Image.asset(
                                                                      AppImages
                                                                          .upload),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .tbTest,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .accepted,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      DashedRectBorder(
                                                        color:
                                                            AppColors.bgColor,
                                                        strokeWidth: 1,
                                                        gapWidth: 3,
                                                        dashWidth: 5,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              children: [
                                                                Center(
                                                                  child: Image.asset(
                                                                      AppImages
                                                                          .upload),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .copyofHCFA,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .accepted,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      DashedRectBorder(
                                                        color:
                                                            AppColors.bgColor,
                                                        strokeWidth: 1,
                                                        gapWidth: 3,
                                                        dashWidth: 5,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10.0),
                                                            child: Column(
                                                              children: [
                                                                Center(
                                                                  child: Image.asset(
                                                                      AppImages
                                                                          .upload),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .eGFR,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp16
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .accepted,
                                                                  style: CommonTextStyles
                                                                      .poppinsSemiBoldStyle
                                                                      .copyWith(
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                    color: AppColors
                                                                        .slightlyGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      )
                                                    ],
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
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  CommonButton(
                                    onPressed: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      common.showCustomSnackBar(
                                          "${AppLocalizations.of(context)!.workinprogress}");
                                      if (_formKey.currentState!.validate()) {}
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
                                      if (_formKey.currentState!.validate()) {}
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
      );
    });
  }
}
