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
import 'package:eshop/modules/Patients/Home/Application/MedicalInformationController.dart';
import 'package:eshop/modules/Patients/Home/Application/StepProgressView.dart';
import '../../../../components/CommonFunctions/CommonFunctions.dart' as common;

// ignore: must_be_immutable
class MedicalInformation extends StatefulWidget {
  const MedicalInformation({
    super.key,
  });

  @override
  State<MedicalInformation> createState() => _MedicalInformationState();
}

class _MedicalInformationState extends State<MedicalInformation> {
  var applicationController = Get.put(ApplicationController());
  var medicalInformationController = Get.put(MedicalInformationController());
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
                                                  .medicalinfo,
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
                                      Container(
                                        height: 6.h,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "(1/4)",
                                          style: CommonTextStyles
                                              .poppinsSemiBoldStyle
                                              .copyWith(
                                            fontSize: CommonFontSizes.sp16.sp,
                                            color: AppColors.bgColor,
                                          ),
                                        ),
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
                                              width: 85.w,
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
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .pulmonary,
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
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 60.w,
                                                                child:
                                                                    ListTileTheme(
                                                                  horizontalTitleGap:
                                                                      0.0,
                                                                  child:
                                                                      CheckboxListTile(
                                                                    value: medicalInformationController
                                                                        .tb
                                                                        .value!,
                                                                    onChanged:
                                                                        (value) {
                                                                      medicalInformationController
                                                                              .tb
                                                                              .value =
                                                                          value!;
                                                                    },
                                                                    checkColor:
                                                                        AppColors
                                                                            .primaryColor,
                                                                    activeColor: AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                    side: const BorderSide(
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        width:
                                                                            2),
                                                                    title: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .tb,
                                                                      style: CommonTextStyles
                                                                          .poppinsRegularStyle
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontSize: CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                      ),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 70.w,
                                                                child:
                                                                    ListTileTheme(
                                                                  horizontalTitleGap:
                                                                      0.0,
                                                                  child:
                                                                      CheckboxListTile(
                                                                    value: medicalInformationController
                                                                        .xray
                                                                        .value!,
                                                                    onChanged:
                                                                        (value) {
                                                                      medicalInformationController
                                                                          .xray
                                                                          .value = value!;
                                                                    },
                                                                    checkColor:
                                                                        AppColors
                                                                            .primaryColor,
                                                                    activeColor: AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                    side: const BorderSide(
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        width:
                                                                            2),
                                                                    title: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .historyofxray,
                                                                      style: CommonTextStyles
                                                                          .poppinsRegularStyle
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontSize: CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                      ),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          ListTileTheme(
                                                                        horizontalTitleGap:
                                                                            0.0,
                                                                        child:
                                                                            CheckboxListTile(
                                                                          value: medicalInformationController
                                                                              .chronic
                                                                              .value!,
                                                                          onChanged:
                                                                              (value) {
                                                                            medicalInformationController.chronic.value =
                                                                                value!;
                                                                          },
                                                                          checkColor:
                                                                              AppColors.primaryColor,
                                                                          activeColor: AppColors
                                                                              .bgColor
                                                                              .withOpacity(.2),
                                                                          side: const BorderSide(
                                                                              color: AppColors.primaryColor,
                                                                              width: 2),
                                                                          title:
                                                                              Text(
                                                                            AppLocalizations.of(context)!.chronicBronchitis,
                                                                            style:
                                                                                CommonTextStyles.poppinsRegularStyle.copyWith(
                                                                              color: AppColors.blackColor,
                                                                              fontSize: CommonFontSizes.sp14.sp,
                                                                            ),
                                                                          ),
                                                                          contentPadding:
                                                                              EdgeInsets.zero,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          ListTileTheme(
                                                                        horizontalTitleGap:
                                                                            0.0,
                                                                        child:
                                                                            CheckboxListTile(
                                                                          value: medicalInformationController
                                                                              .asthma
                                                                              .value!,
                                                                          onChanged:
                                                                              (value) {
                                                                            medicalInformationController.asthma.value =
                                                                                value!;
                                                                          },
                                                                          checkColor:
                                                                              AppColors.primaryColor,
                                                                          activeColor: AppColors
                                                                              .bgColor
                                                                              .withOpacity(.2),
                                                                          side: const BorderSide(
                                                                              color: AppColors.primaryColor,
                                                                              width: 2),
                                                                          title:
                                                                              Text(
                                                                            AppLocalizations.of(context)!.asthma,
                                                                            style:
                                                                                CommonTextStyles.poppinsRegularStyle.copyWith(
                                                                              color: AppColors.blackColor,
                                                                              fontSize: CommonFontSizes.sp14.sp,
                                                                            ),
                                                                          ),
                                                                          contentPadding:
                                                                              EdgeInsets.zero,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          ListTileTheme(
                                                                        horizontalTitleGap:
                                                                            0.0,
                                                                        child:
                                                                            CheckboxListTile(
                                                                          value: medicalInformationController
                                                                              .chronic
                                                                              .value!,
                                                                          onChanged:
                                                                              (value) {
                                                                            medicalInformationController.chronic.value =
                                                                                value!;
                                                                          },
                                                                          checkColor:
                                                                              AppColors.primaryColor,
                                                                          activeColor: AppColors
                                                                              .bgColor
                                                                              .withOpacity(.2),
                                                                          side: const BorderSide(
                                                                              color: AppColors.primaryColor,
                                                                              width: 2),
                                                                          title:
                                                                              Text(
                                                                            AppLocalizations.of(context)!.emphusema,
                                                                            style:
                                                                                CommonTextStyles.poppinsRegularStyle.copyWith(
                                                                              color: AppColors.blackColor,
                                                                              fontSize: CommonFontSizes.sp14.sp,
                                                                            ),
                                                                          ),
                                                                          contentPadding:
                                                                              EdgeInsets.zero,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          ListTileTheme(
                                                                        horizontalTitleGap:
                                                                            0.0,
                                                                        child:
                                                                            CheckboxListTile(
                                                                          value: medicalInformationController
                                                                              .asthma
                                                                              .value!,
                                                                          onChanged:
                                                                              (value) {
                                                                            medicalInformationController.asthma.value =
                                                                                value!;
                                                                          },
                                                                          checkColor:
                                                                              AppColors.primaryColor,
                                                                          activeColor: AppColors
                                                                              .bgColor
                                                                              .withOpacity(.2),
                                                                          side: const BorderSide(
                                                                              color: AppColors.primaryColor,
                                                                              width: 2),
                                                                          title:
                                                                              Text(
                                                                            AppLocalizations.of(context)!.oxygenUse,
                                                                            style:
                                                                                CommonTextStyles.poppinsRegularStyle.copyWith(
                                                                              color: AppColors.blackColor,
                                                                              fontSize: CommonFontSizes.sp14.sp,
                                                                            ),
                                                                          ),
                                                                          contentPadding:
                                                                              EdgeInsets.zero,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          ListTileTheme(
                                                                        horizontalTitleGap:
                                                                            0.0,
                                                                        child:
                                                                            CheckboxListTile(
                                                                          value: medicalInformationController
                                                                              .sleep
                                                                              .value!,
                                                                          onChanged:
                                                                              (value) {
                                                                            medicalInformationController.sleep.value =
                                                                                value!;
                                                                          },
                                                                          checkColor:
                                                                              AppColors.primaryColor,
                                                                          activeColor: AppColors
                                                                              .bgColor
                                                                              .withOpacity(.2),
                                                                          side: const BorderSide(
                                                                              color: AppColors.primaryColor,
                                                                              width: 2),
                                                                          title:
                                                                              Text(
                                                                            AppLocalizations.of(context)!.sleepApnea,
                                                                            style:
                                                                                CommonTextStyles.poppinsRegularStyle.copyWith(
                                                                              color: AppColors.blackColor,
                                                                              fontSize: CommonFontSizes.sp14.sp,
                                                                            ),
                                                                          ),
                                                                          contentPadding:
                                                                              EdgeInsets.zero,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          ListTileTheme(
                                                                        horizontalTitleGap:
                                                                            0.0,
                                                                        child:
                                                                            CheckboxListTile(
                                                                          value: medicalInformationController
                                                                              .cpap
                                                                              .value!,
                                                                          onChanged:
                                                                              (value) {
                                                                            medicalInformationController.cpap.value =
                                                                                value!;
                                                                          },
                                                                          checkColor:
                                                                              AppColors.primaryColor,
                                                                          activeColor: AppColors
                                                                              .bgColor
                                                                              .withOpacity(.2),
                                                                          side: const BorderSide(
                                                                              color: AppColors.primaryColor,
                                                                              width: 2),
                                                                          title:
                                                                              Text(
                                                                            AppLocalizations.of(context)!.cpap,
                                                                            style:
                                                                                CommonTextStyles.poppinsRegularStyle.copyWith(
                                                                              color: AppColors.blackColor,
                                                                              fontSize: CommonFontSizes.sp14.sp,
                                                                            ),
                                                                          ),
                                                                          contentPadding:
                                                                              EdgeInsets.zero,
                                                                          controlAffinity:
                                                                              ListTileControlAffinity.leading,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 70.w,
                                                                child:
                                                                    ListTileTheme(
                                                                  horizontalTitleGap:
                                                                      0.0,
                                                                  child:
                                                                      CheckboxListTile(
                                                                    value: medicalInformationController
                                                                        .lung
                                                                        .value!,
                                                                    onChanged:
                                                                        (value) {
                                                                      medicalInformationController
                                                                          .lung
                                                                          .value = value!;
                                                                    },
                                                                    checkColor:
                                                                        AppColors
                                                                            .primaryColor,
                                                                    activeColor: AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                    side: const BorderSide(
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        width:
                                                                            2),
                                                                    title: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .historyoflung,
                                                                      style: CommonTextStyles
                                                                          .poppinsRegularStyle
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontSize: CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                      ),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 70.w,
                                                                child:
                                                                    ListTileTheme(
                                                                  horizontalTitleGap:
                                                                      0.0,
                                                                  minVerticalPadding:
                                                                      0.0,
                                                                  child:
                                                                      CheckboxListTile(
                                                                    value: medicalInformationController
                                                                        .lungcan
                                                                        .value!,
                                                                    onChanged:
                                                                        (value) {
                                                                      medicalInformationController
                                                                          .lungcan
                                                                          .value = value!;
                                                                    },
                                                                    checkColor:
                                                                        AppColors
                                                                            .primaryColor,
                                                                    activeColor: AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                    side: const BorderSide(
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        width:
                                                                            2),
                                                                    title: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .hislungcan,
                                                                      style: CommonTextStyles
                                                                          .poppinsRegularStyle
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontSize: CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                      ),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              SizedBox(
                                                                width: 70.w,
                                                                child:
                                                                    ListTileTheme(
                                                                  horizontalTitleGap:
                                                                      0.0,
                                                                  minVerticalPadding:
                                                                      0.0,
                                                                  child:
                                                                      CheckboxListTile(
                                                                    value: medicalInformationController
                                                                        .histb
                                                                        .value!,
                                                                    onChanged:
                                                                        (value) {
                                                                      medicalInformationController
                                                                          .histb
                                                                          .value = value!;
                                                                    },
                                                                    checkColor:
                                                                        AppColors
                                                                            .primaryColor,
                                                                    activeColor: AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                    side: const BorderSide(
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        width:
                                                                            2),
                                                                    title: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .hisTBskin,
                                                                      style: CommonTextStyles
                                                                          .poppinsRegularStyle
                                                                          .copyWith(
                                                                        color: AppColors
                                                                            .blackColor,
                                                                        fontSize: CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                      ),
                                                                    ),
                                                                    contentPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .leading,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
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

                                                              medicalInformationController
                                                                      .dateof
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
                                                            onChanged:
                                                                (value) {},
                                                            cursorColor:
                                                                AppColors
                                                                    .bgColor,
                                                            controller:
                                                                medicalInformationController
                                                                    .dateof!,
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
                                                                      .tbSkinwhen,
                                                              labelStyle: TextStyle(
                                                                  color: AppColors
                                                                      .bgColor,
                                                                  fontSize:
                                                                      CommonFontSizes
                                                                          .sp12),
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
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .eyeear,
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
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      ListTileTheme(
                                                                    horizontalTitleGap:
                                                                        0.0,
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: medicalInformationController
                                                                          .blindness
                                                                          .value!,
                                                                      onChanged:
                                                                          (value) {
                                                                        medicalInformationController
                                                                            .blindness
                                                                            .value = value!;
                                                                      },
                                                                      checkColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      activeColor: AppColors
                                                                          .bgColor
                                                                          .withOpacity(
                                                                              .2),
                                                                      side: const BorderSide(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          width:
                                                                              2),
                                                                      title:
                                                                          Text(
                                                                        AppLocalizations.of(context)!
                                                                            .blindness,
                                                                        style: CommonTextStyles
                                                                            .poppinsRegularStyle
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.blackColor,
                                                                          fontSize: CommonFontSizes
                                                                              .sp14
                                                                              .sp,
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      ListTileTheme(
                                                                    horizontalTitleGap:
                                                                        0.0,
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: medicalInformationController
                                                                          .glaucoma
                                                                          .value!,
                                                                      onChanged:
                                                                          (value) {
                                                                        medicalInformationController
                                                                            .glaucoma
                                                                            .value = value!;
                                                                      },
                                                                      checkColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      activeColor: AppColors
                                                                          .bgColor
                                                                          .withOpacity(
                                                                              .2),
                                                                      side: const BorderSide(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          width:
                                                                              2),
                                                                      title:
                                                                          Text(
                                                                        AppLocalizations.of(context)!
                                                                            .asthma,
                                                                        style: CommonTextStyles
                                                                            .poppinsRegularStyle
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.blackColor,
                                                                          fontSize: CommonFontSizes
                                                                              .sp14
                                                                              .sp,
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                ListTileTheme(
                                                              horizontalTitleGap:
                                                                  0.0,
                                                              child:
                                                                  CheckboxListTile(
                                                                value: medicalInformationController
                                                                    .diabeticre
                                                                    .value!,
                                                                onChanged:
                                                                    (value) {
                                                                  medicalInformationController
                                                                      .diabeticre
                                                                      .value = value!;
                                                                },
                                                                checkColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                side: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width: 2),
                                                                title: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .diabeticre,
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                ListTileTheme(
                                                              horizontalTitleGap:
                                                                  0.0,
                                                              child:
                                                                  CheckboxListTile(
                                                                value:
                                                                    medicalInformationController
                                                                        .deafness
                                                                        .value!,
                                                                onChanged:
                                                                    (value) {
                                                                  medicalInformationController
                                                                          .deafness
                                                                          .value =
                                                                      value!;
                                                                },
                                                                checkColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                side: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width: 2),
                                                                title: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .deafness,
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: AppColors
                                                                .bgColor, // Border color
                                                            width:
                                                                1.0, // Border width
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10.0), // Border radius
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            SingleChildScrollView(
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .medifirsttext,
                                                                      style: CommonTextStyles
                                                                          .poppinsRegularStyle
                                                                          .copyWith(
                                                                        fontSize: CommonFontSizes
                                                                            .sp15
                                                                            .sp,
                                                                        color: AppColors
                                                                            .bgColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextFormField(
                                                                    maxLines:
                                                                        2, // Allow multiline
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none, // Hide border

                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .cardiandvas,
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
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .heartandcir,
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
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 60.w,
                                                            child:
                                                                ListTileTheme(
                                                              horizontalTitleGap:
                                                                  0.0,
                                                              child:
                                                                  CheckboxListTile(
                                                                value: medicalInformationController
                                                                    .hypertension
                                                                    .value!,
                                                                onChanged:
                                                                    (value) {
                                                                  medicalInformationController
                                                                      .hypertension
                                                                      .value = value!;
                                                                },
                                                                checkColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                side: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width: 2),
                                                                title: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .hypertension,
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 70.w,
                                                            child:
                                                                ListTileTheme(
                                                              horizontalTitleGap:
                                                                  0.0,
                                                              child:
                                                                  CheckboxListTile(
                                                                value: medicalInformationController
                                                                    .frequentFluid
                                                                    .value!,
                                                                onChanged:
                                                                    (value) {
                                                                  medicalInformationController
                                                                      .frequentFluid
                                                                      .value = value!;
                                                                },
                                                                checkColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                side: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width: 2),
                                                                title: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .frequentfluid,
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                ListTileTheme(
                                                              horizontalTitleGap:
                                                                  0.0,
                                                              child:
                                                                  CheckboxListTile(
                                                                value: medicalInformationController
                                                                    .congestive
                                                                    .value!,
                                                                onChanged:
                                                                    (value) {
                                                                  medicalInformationController
                                                                      .congestive
                                                                      .value = value!;
                                                                },
                                                                checkColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                side: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width: 2),
                                                                title: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .congestive,
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                ListTileTheme(
                                                              horizontalTitleGap:
                                                                  0.0,
                                                              child:
                                                                  CheckboxListTile(
                                                                value:
                                                                    medicalInformationController
                                                                        .coronary
                                                                        .value!,
                                                                onChanged:
                                                                    (value) {
                                                                  medicalInformationController
                                                                          .coronary
                                                                          .value =
                                                                      value!;
                                                                },
                                                                checkColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                side: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width: 2),
                                                                title: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .coronary,
                                                                  softWrap:
                                                                      true,
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      ListTileTheme(
                                                                    horizontalTitleGap:
                                                                        0.0,
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: medicalInformationController
                                                                          .heartattack
                                                                          .value!,
                                                                      onChanged:
                                                                          (value) {
                                                                        medicalInformationController
                                                                            .heartattack
                                                                            .value = value!;
                                                                      },
                                                                      checkColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      activeColor: AppColors
                                                                          .bgColor
                                                                          .withOpacity(
                                                                              .2),
                                                                      side: const BorderSide(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          width:
                                                                              2),
                                                                      title:
                                                                          Text(
                                                                        AppLocalizations.of(context)!
                                                                            .heartattack,
                                                                        style: CommonTextStyles
                                                                            .poppinsRegularStyle
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.blackColor,
                                                                          fontSize: CommonFontSizes
                                                                              .sp14
                                                                              .sp,
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      ListTileTheme(
                                                                    horizontalTitleGap:
                                                                        0.0,
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: medicalInformationController
                                                                          .heartsurgery
                                                                          .value!,
                                                                      onChanged:
                                                                          (value) {
                                                                        medicalInformationController
                                                                            .heartsurgery
                                                                            .value = value!;
                                                                      },
                                                                      checkColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      activeColor: AppColors
                                                                          .bgColor
                                                                          .withOpacity(
                                                                              .2),
                                                                      side: const BorderSide(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          width:
                                                                              2),
                                                                      title:
                                                                          Text(
                                                                        AppLocalizations.of(context)!
                                                                            .heartSurgery,
                                                                        style: CommonTextStyles
                                                                            .poppinsRegularStyle
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.blackColor,
                                                                          fontSize: CommonFontSizes
                                                                              .sp14
                                                                              .sp,
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                ListTileTheme(
                                                              horizontalTitleGap:
                                                                  0.0,
                                                              child:
                                                                  CheckboxListTile(
                                                                value: medicalInformationController
                                                                    .poorcirculation
                                                                    .value!,
                                                                onChanged:
                                                                    (value) {
                                                                  medicalInformationController
                                                                      .poorcirculation
                                                                      .value = value!;
                                                                },
                                                                checkColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                side: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width: 2),
                                                                title: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .poorciculation,
                                                                  softWrap:
                                                                      true,
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                ListTileTheme(
                                                              horizontalTitleGap:
                                                                  0.0,
                                                              child:
                                                                  CheckboxListTile(
                                                                value:
                                                                    medicalInformationController
                                                                        .paininleg
                                                                        .value!,
                                                                onChanged:
                                                                    (value) {
                                                                  medicalInformationController
                                                                      .paininleg
                                                                      .value = value!;
                                                                },
                                                                checkColor:
                                                                    AppColors
                                                                        .primaryColor,
                                                                activeColor:
                                                                    AppColors
                                                                        .bgColor
                                                                        .withOpacity(
                                                                            .2),
                                                                side: const BorderSide(
                                                                    color: AppColors
                                                                        .primaryColor,
                                                                    width: 2),
                                                                title: Text(
                                                                  AppLocalizations.of(
                                                                          context)!
                                                                      .paininleg,
                                                                  softWrap:
                                                                      true,
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                controlAffinity:
                                                                    ListTileControlAffinity
                                                                        .leading,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      ListTileTheme(
                                                                    horizontalTitleGap:
                                                                        0.0,
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: medicalInformationController
                                                                          .amputations
                                                                          .value!,
                                                                      onChanged:
                                                                          (value) {
                                                                        medicalInformationController
                                                                            .amputations
                                                                            .value = value!;
                                                                      },
                                                                      checkColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      activeColor: AppColors
                                                                          .bgColor
                                                                          .withOpacity(
                                                                              .2),
                                                                      side: const BorderSide(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          width:
                                                                              2),
                                                                      title:
                                                                          Text(
                                                                        AppLocalizations.of(context)!
                                                                            .amputations,
                                                                        style: CommonTextStyles
                                                                            .poppinsRegularStyle
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.blackColor,
                                                                          fontSize: CommonFontSizes
                                                                              .sp14
                                                                              .sp,
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      ListTileTheme(
                                                                    horizontalTitleGap:
                                                                        0.0,
                                                                    child:
                                                                        CheckboxListTile(
                                                                      value: medicalInformationController
                                                                          .bloodclots
                                                                          .value!,
                                                                      onChanged:
                                                                          (value) {
                                                                        medicalInformationController
                                                                            .bloodclots
                                                                            .value = value!;
                                                                      },
                                                                      checkColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      activeColor: AppColors
                                                                          .bgColor
                                                                          .withOpacity(
                                                                              .2),
                                                                      side: const BorderSide(
                                                                          color: AppColors
                                                                              .primaryColor,
                                                                          width:
                                                                              2),
                                                                      title:
                                                                          Text(
                                                                        AppLocalizations.of(context)!
                                                                            .bloodclots,
                                                                        style: CommonTextStyles
                                                                            .poppinsRegularStyle
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.blackColor,
                                                                          fontSize: CommonFontSizes
                                                                              .sp14
                                                                              .sp,
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      controlAffinity:
                                                                          ListTileControlAffinity
                                                                              .leading,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: AppColors
                                                                .bgColor, // Border color
                                                            width:
                                                                1.0, // Border width
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10.0), // Border radius
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            SingleChildScrollView(
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                      AppLocalizations.of(
                                                                              context)!
                                                                          .medifirstsecondtext,
                                                                      style: CommonTextStyles
                                                                          .poppinsRegularStyle
                                                                          .copyWith(
                                                                        fontSize: CommonFontSizes
                                                                            .sp15
                                                                            .sp,
                                                                        color: AppColors
                                                                            .bgColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextFormField(
                                                                    maxLines:
                                                                        2, // Allow multiline
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none, // Hide border

                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
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
                                                                .nameisrequired;
                                                          }

                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        controller:
                                                            medicalInformationController!
                                                                .cardiologistName!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .cardiologist,
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
                                                              value == null ||
                                                              value
                                                                  .trim()
                                                                  .isEmpty) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .phonerequired;
                                                          }
                                                          if (!RegExp("[0-9]")
                                                              .hasMatch(
                                                                  value!)) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .phoneNumberError;
                                                          }
                                                          if (value.length <
                                                              10) {
                                                            setState(() {});
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .phoneNumberError;
                                                          }
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        controller:
                                                            medicalInformationController
                                                                .cardiologistTele!,
                                                        maxLength: 10,
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .cardiotelephone,
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
                                                                      .circular(
                                                                          2.w),
                                                              borderSide: const BorderSide(
                                                                  color: AppColors
                                                                      .primaryColor)),
                                                          counterText: "",
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  15, 0, 15, 0),
                                                        ),
                                                        onChanged: (value) {},
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
                                                            TextInputType.phone,
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
                                                                .nameisrequired;
                                                          }

                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        controller:
                                                            medicalInformationController!
                                                                .vascularSurgeon!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .vascularSurgeon,
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
                                                              value == null ||
                                                              value
                                                                  .trim()
                                                                  .isEmpty) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .phonerequired;
                                                          }
                                                          if (!RegExp("[0-9]")
                                                              .hasMatch(
                                                                  value!)) {
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .phoneNumberError;
                                                          }
                                                          if (value.length <
                                                              10) {
                                                            setState(() {});
                                                            return AppLocalizations
                                                                    .of(context)!
                                                                .phoneNumberError;
                                                          }
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        controller:
                                                            medicalInformationController
                                                                .vascularSurgeonTele!,
                                                        maxLength: 10,
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          labelText: AppLocalizations
                                                                  .of(context)!
                                                              .vascularSurgeonTelephonenumber,
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
                                                                      .circular(
                                                                          2.w),
                                                              borderSide: const BorderSide(
                                                                  color: AppColors
                                                                      .primaryColor)),
                                                          counterText: "",
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  15, 0, 15, 0),
                                                        ),
                                                        onChanged: (value) {},
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
                                                            TextInputType.phone,
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
