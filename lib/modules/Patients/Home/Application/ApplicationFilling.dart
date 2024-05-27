// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/modules/Patients/Home/Application/AdditionalInfo.dart';
import 'package:eshop/modules/Patients/Home/Application/ApplicationController.dart';
import 'package:eshop/modules/Patients/Home/Application/CancerScreenings.dart';
import 'package:eshop/modules/Patients/Home/Application/Insurance.dart';
import 'package:eshop/modules/Patients/Home/Application/MedicalInformation.dart';
import 'package:eshop/modules/Patients/Home/Application/Medications.dart';
import 'package:eshop/modules/Patients/Home/Application/PatientInformation.dart';
import 'package:eshop/modules/Patients/Home/Application/ReferringPhy.dart';
import 'package:eshop/modules/Patients/Home/Application/RequiredDocument.dart';
import 'package:eshop/modules/Patients/Home/Application/StepProgressView.dart';
import '../../../../components/CommonFunctions/CommonFunctions.dart' as common;

// ignore: must_be_immutable
class ApplicationFilling extends StatefulWidget {
  const ApplicationFilling({
    super.key,
  });

  @override
  State<ApplicationFilling> createState() => _ApplicationFillingState();
}

class _ApplicationFillingState extends State<ApplicationFilling> {
  var applicationController = Get.put(ApplicationController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    applicationController.getformStatus();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
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
            () => SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Center(
                      child: Container(
                        width: 90.w,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              child: StepProgressView(
                                currentProgress:
                                    applicationController!.percentage!.value!,
                                totalSteps: 10,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => PatientInformation());
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains('patient_info'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains('patient_info'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .patientinfo,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'patient_info'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains('patient_info'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const Insurance());
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains('insurance_info'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains('insurance_info'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
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
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'insurance_info'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains('insurance_info'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const AdditionalInfo());
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains('addons_information'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains(
                                                        'addons_information'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .additionalinfo,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'addons_information'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains('addons_information'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const RequiredDocuments());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains('documents'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains('documents'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .requiredDocuments,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'documents'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains('documents'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const ReferringPhy());
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains('referring_physician'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains(
                                                        'referring_physician'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          width: 67.w,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            softWrap: true,
                                            AppLocalizations.of(context)!
                                                .referringPhysicianopt,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'referring_physician'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains(
                                                    'referring_physician'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const Medications());
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains('medications_name'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains(
                                                        'medications_name'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .medication,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'medications_name'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains('medications_name'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const CancerScreenings());
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains('cancer_screening'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains(
                                                        'cancer_screening'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .cancerScreening,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'cancer_screening'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains('cancer_screening'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains('general_information'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains(
                                                        'general_information'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .generalinfo,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'general_information'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains(
                                                    'general_information'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const MedicalInformation());
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains(
                                                  'medical_information_1'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains(
                                                        'medical_information_1'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .medicalinfo,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'medical_information_1'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains(
                                                    'medical_information_1'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains(
                                                  'additional_information'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains(
                                                        'additional_information'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .additionalinfo,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp15.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'additional_information'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains(
                                                    'additional_information'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                common.showCustomSnackBar(
                                    "${AppLocalizations.of(context)!.workinprogress}");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: (applicationController.filledFields !=
                                              null &&
                                          applicationController.filledFields!
                                              .contains('special_concerns'))
                                      ? AppColors.bgColor
                                      : AppColors.whiteColor,
                                  border: Border.all(
                                    color: AppColors.bgColor.withOpacity(0.5),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        (applicationController.filledFields !=
                                                    null &&
                                                applicationController
                                                    .filledFields!
                                                    .contains(
                                                        'special_concerns'))
                                            ? Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.whiteform),
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.form),
                                                  ),
                                                ),
                                              ),
                                        Container(
                                          height: 6.h,
                                          decoration: BoxDecoration(),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .specialCon,
                                            style: CommonTextStyles
                                                .poppinsSemiBoldStyle
                                                .copyWith(
                                              fontSize: CommonFontSizes.sp16.sp,
                                              color: (applicationController
                                                              .filledFields !=
                                                          null &&
                                                      applicationController
                                                          .filledFields!
                                                          .contains(
                                                              'special_concerns'))
                                                  ? AppColors.whiteColor
                                                  : AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    (applicationController.filledFields !=
                                                null &&
                                            applicationController.filledFields!
                                                .contains('special_concerns'))
                                        ? Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdownwhite),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 4.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.dropdown),
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CommonButton(
                              width: 100.w,
                              onPressed: applicationController!
                                          .percentage!.value! ==
                                      applicationController!.isComplete!.value!
                                  ? () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      if (_formKey.currentState!.validate()) {}
                                    }
                                  : () {
                                      common
                                          .showCustomSnackBar("Button Disable");
                                    },
                              buttonText: AppLocalizations.of(context)!.submit,
                              buttonColor: applicationController!
                                          .percentage!.value! ==
                                      applicationController!.isComplete!.value!
                                  ? AppColors.btnColor
                                  : AppColors.btnColor.withOpacity(.4),
                              textColor: AppColors.whiteColor,
                              fontWeight: CommonFontWeight.semiBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
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
