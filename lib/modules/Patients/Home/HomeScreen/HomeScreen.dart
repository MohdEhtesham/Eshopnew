import 'dart:io';

import 'package:eshop/components/strings/Constants.dart';
import 'package:eshop/modules/Patients/Home/Application/ApplicationController.dart';
import 'package:eshop/modules/Patients/Home/Application/PatientInfoController.dart';
import 'package:eshop/modules/Patients/Login/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/modules/Patients/Home/Profile/Profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../components/CommonExt/Components.dart';
import '../../../../components/Constants/AppColors.dart';
import '../../../../components/Constants/AppFontFamily.dart';
import '../../../../components/Constants/AppImages.dart';
import '../../../ChangeLang/ChangeLangController.dart';
import '../HomeController.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'CustomApplicationStatus.dart';
import 'CustomSearchBar.dart';
import '../../../../../components/CommonFunctions/CommonFunctions.dart'
    as common;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;
  var homeController = Get.put(HomeController());
  var changeLangController = Get.put(ChangeLangController());
  var patientInfoController = Get.put(PatientInfoController());
  var applicationController = Get.put(ApplicationController());

  final _formKey = GlobalKey<FormState>();

  Position? _currentPosition;
  @override
  void initState() {
    _getCurrentPosition();
    homeController.getCenters();
    CheckUserConnection();

    super.initState();
  }

  Future CheckUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // setState(() {
        //   ActiveConnection = true;
        //   T = "Turn off the data and repress again";
        // });
      }
    } on SocketException catch (_) {
      common.showCustomSnackBar(AppLocalizations.of(context!)!.checkinternet);
      // setState(() {
      //   ActiveConnection = false;
      //   T = "Turn On the data and repress again";
      // });
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      //  Future.delayed(const Duration(seconds: 1), () {
      //   common.checkIsLocationServiceEnabled();
      // });
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // If permission is denied forever, open app settings
      openAppSettings();
      return false;
    } else if (permission == LocationPermission.denied) {
      // Show a dialog to prompt the user to allow location permission within the app
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context)!.locationre,
              softWrap: true,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: CommonFontWeight.semiBold,
                fontSize: CommonFontSizes.sp18.sp,
                color: AppColors.blackColor,
              ),
            ),
            content: Text(
              AppLocalizations.of(context)!.locationmsg,
              softWrap: true,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: CommonFontWeight.regular,
                fontSize: CommonFontSizes.sp14.sp,
                color: AppColors.blackColor,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.allow,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: CommonFontWeight.regular,
                    fontSize: CommonFontSizes.sp16.sp,
                    color: const Color.fromARGB(255, 51, 78, 78),
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  // Request location permission again within the app
                  final status = await Geolocator.requestPermission();
                  if (status == LocationPermission.deniedForever) {
                    // If permission is denied forever, open app settings
                    openAppSettings();
                  } else if (status == LocationPermission.denied) {
                    // If permission is still denied, show another dialog
                    _showPermissionDeniedDialog();
                  } else {
                    // Permission granted, update the state
                  }
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    // Permission already granted, update the state

    return true;
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.denied,
            softWrap: true,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: CommonFontWeight.semiBold,
              fontSize: CommonFontSizes.sp18.sp,
              color: AppColors.blackColor,
            ),
          ),
          content: Text(
            AppLocalizations.of(context)!.deniedmsg,
            softWrap: true,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: CommonFontWeight.regular,
              fontSize: CommonFontSizes.sp14.sp,
              color: AppColors.blackColor,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "OK",
                softWrap: true,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: CommonFontWeight.regular,
                  fontSize: CommonFontSizes.sp16.sp,
                  color: AppColors.bgColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      changeLangController.getUserLocationDetails(_currentPosition!);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return PopScope(
        canPop: false,
        child: Scaffold(
          appBar:

// Assuming you have a ChangeLangController class where isLoading is defined as an observable bool

              AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            iconTheme: const IconThemeData(color: AppColors.primaryColor),
            titleSpacing: 10.0,
            leading: Container(
              margin: const EdgeInsets.only(left: 15),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.locationIcon),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            leadingWidth: 50.0,
            title: Obx(() {
              if (changeLangController.isLoading.value) {
                return const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ); // Show circular progress indicator when isLoading is true
              } else {
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.location,
                          style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                            fontSize: CommonFontSizes.sp16.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(
                          width: 60.w,
                          child: Text(
                            changeLangController.userLocation.value!,
                            style:
                                CommonTextStyles.poppinsRegularStyle.copyWith(
                              fontSize: CommonFontSizes.sp16.sp,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
            centerTitle: false,
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  // Navigate to my profile screen
                  Get.to(() => Login());
                },
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  margin: const EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.blackColor.withOpacity(0.2),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(AppImages.logout),
                        fit: BoxFit.contain,
                      ),
                      color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
          body: Obx(
            () => SingleChildScrollView(
              child: Container(
                color: AppColors.whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: Container(
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: AppColors.bgColor.withOpacity(.2),
                          border: Border.all(
                            color: AppColors.whiteColor.withOpacity(.2),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          // color: Colors.red,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Center(
                                  child: Container(
                                    width: 80.w,
                                    color: AppColors.whiteColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
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
                                                      AutovalidateMode.disabled,
                                                  validator: (value) {
                                                    if (value == "" ||
                                                        value == null ||
                                                        value.trim().isEmpty) {
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .nameisrequired;
                                                    }
                                                    return null;
                                                  },
                                                  cursorColor:
                                                      AppColors.blackColor,
                                                  controller:
                                                      patientInfoController
                                                          .nameController!,
                                                  decoration: InputDecoration(
                                                    counterText: "",
                                                    labelText:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .nameEdit,
                                                    filled: true,
                                                    fillColor:
                                                        AppColors.whiteColor,
                                                    border: OutlineInputBorder(
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
                                                        color: AppColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.w),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    labelStyle: TextStyle(
                                                        color:
                                                            AppColors.bgColor,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp14),
                                                    hintStyle: CommonTextStyles
                                                        .poppinsMediumStyle
                                                        .copyWith(
                                                      color: AppColors.bgColor
                                                          .withOpacity(.5),
                                                      fontSize: CommonFontSizes
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
                                                  onFieldSubmitted: (value) {
                                                    if (_formKey.currentState!
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
                                                    color: AppColors.blackColor,
                                                    fontSize:
                                                        CommonFontSizes.sp14.sp,
                                                  ),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                ),
                                                SizedBox(height: 2.h),
                                                TextFormField(
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  validator: (value) {
                                                    if (value == "" ||
                                                        value == null ||
                                                        value.trim().isEmpty) {
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .addressisrequired;
                                                    }

                                                    return null;
                                                  },
                                                  cursorColor:
                                                      AppColors.blackColor,
                                                  controller:
                                                      patientInfoController
                                                          .address!,
                                                  decoration: InputDecoration(
                                                    counterText: "",
                                                    labelText:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .address,
                                                    filled: true,
                                                    fillColor:
                                                        AppColors.whiteColor,
                                                    border: OutlineInputBorder(
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
                                                              color: AppColors
                                                                  .primaryColor),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: AppColors
                                                                    .primaryColor)),
                                                    labelStyle: TextStyle(
                                                        color:
                                                            AppColors.bgColor,
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
                                                                    .sp16.sp),
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
                                                  onFieldSubmitted: (value) {
                                                    if (_formKey.currentState!
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
                                                                  .sp14.sp),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                ),
                                                SizedBox(height: 2.h),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 35.w,
                                                      child: TextFormField(
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
                                                                .citynameisrequired;
                                                          }

                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        controller:
                                                            patientInfoController
                                                                .city!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .city,
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
                                                    ),
                                                    SizedBox(width: 1.w),
                                                    Container(
                                                      width: 35.w,
                                                      child: TextFormField(
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
                                                                .stateisrequired;
                                                          }

                                                          return null;
                                                        },
                                                        cursorColor: AppColors
                                                            .blackColor,
                                                        controller:
                                                            patientInfoController
                                                                .state!,
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: "",
                                                          labelText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .state,
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
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 2.h),
                                                TextFormField(
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  validator: (value) {
                                                    if (value == "" ||
                                                        value == null ||
                                                        value.trim().isEmpty) {
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .zipcodeisrequired;
                                                    }

                                                    return null;
                                                  },
                                                  cursorColor:
                                                      AppColors.blackColor,
                                                  controller:
                                                      patientInfoController
                                                          .zipcode!,
                                                  decoration: InputDecoration(
                                                    counterText: "",
                                                    labelText:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .zipcode,
                                                    filled: true,
                                                    fillColor:
                                                        AppColors.whiteColor,
                                                    border: OutlineInputBorder(
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
                                                              color: AppColors
                                                                  .primaryColor),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: AppColors
                                                                    .primaryColor)),
                                                    labelStyle: TextStyle(
                                                        color:
                                                            AppColors.bgColor,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp14),
                                                    hintStyle: CommonTextStyles
                                                        .poppinsMediumStyle
                                                        .copyWith(
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    .5),
                                                            fontSize:
                                                                CommonFontSizes
                                                                    .sp14.sp),
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
                                                  onFieldSubmitted: (value) {
                                                    if (_formKey.currentState!
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
                                                                  .sp14.sp),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                ),
                                                SizedBox(height: 2.h),
                                                TextFormField(
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp("[0-9]")),
                                                  ],
                                                  validator: (value) {
                                                    if (value == "" ||
                                                        value == null ||
                                                        value.trim().isEmpty) {
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .phonerequired;
                                                    }
                                                    if (!RegExp("[0-9]")
                                                        .hasMatch(value!)) {
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .phoneNumberError;
                                                    }
                                                    if (value.length < 10) {
                                                      setState(() {});
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .phoneNumberError;
                                                    }
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                    return null;
                                                  },
                                                  cursorColor:
                                                      AppColors.blackColor,
                                                  controller:
                                                      patientInfoController
                                                          .phone!,
                                                  maxLength: 10,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    labelText:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .phone,
                                                    labelStyle: TextStyle(
                                                        color:
                                                            AppColors.bgColor,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp14),
                                                    fillColor:
                                                        AppColors.whiteColor,
                                                    border: OutlineInputBorder(
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
                                                              color: AppColors
                                                                  .primaryColor),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: AppColors
                                                                    .primaryColor)),
                                                    counterText: "",
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .fromLTRB(
                                                            15, 0, 15, 0),
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
                                                  onFieldSubmitted: (value) {
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
                                                                  .sp14.sp),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                ),
                                                SizedBox(height: 2.h),
                                                TextFormField(
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  validator: (value) {
                                                    // if (isSignupButtonActive) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .emailisrequired;
                                                    }
                                                    if (!RegExp(Constants
                                                            .emailRegex)
                                                        .hasMatch(value)) {
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .validemail;
                                                    }
                                                    return null;
                                                    // }
                                                  },
                                                  cursorColor:
                                                      const Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                  controller:
                                                      patientInfoController
                                                          .email!,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    labelText:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .emailp,
                                                    labelStyle: TextStyle(
                                                        color:
                                                            AppColors.bgColor,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp14),
                                                    fillColor:
                                                        AppColors.whiteColor,
                                                    border: OutlineInputBorder(
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
                                                              color: AppColors
                                                                  .primaryColor),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: AppColors
                                                                    .primaryColor)),
                                                    counterText: "",
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .fromLTRB(
                                                            15, 0, 15, 0),
                                                  ),
                                                  onChanged: (value) {},
                                                  onFieldSubmitted: (value) {
                                                    if (_formKey.currentState!
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
                                                                  .sp14.sp),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                TextFormField(
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  validator: (value) {
                                                    if (value == "" ||
                                                        value == null ||
                                                        value.trim().isEmpty) {
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .emergencycontactrquired;
                                                    }
                                                    return null;
                                                  },
                                                  cursorColor:
                                                      AppColors.blackColor,
                                                  controller:
                                                      patientInfoController
                                                          .emergencycontact!,
                                                  decoration: InputDecoration(
                                                    counterText: "",
                                                    labelText:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .emergencycontact,
                                                    filled: true,
                                                    fillColor:
                                                        AppColors.whiteColor,
                                                    border: OutlineInputBorder(
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
                                                        color: AppColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.w),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    labelStyle: TextStyle(
                                                        color:
                                                            AppColors.bgColor,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp14),
                                                    hintStyle: CommonTextStyles
                                                        .poppinsMediumStyle
                                                        .copyWith(
                                                      color: AppColors.bgColor
                                                          .withOpacity(.5),
                                                      fontSize: CommonFontSizes
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
                                                  onFieldSubmitted: (value) {
                                                    if (_formKey.currentState!
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
                                                    color: AppColors.blackColor,
                                                    fontSize:
                                                        CommonFontSizes.sp14.sp,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                ),
                                                SizedBox(height: 2.h),
                                                TextFormField(
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  validator: (value) {
                                                    if (value == "" ||
                                                        value == null ||
                                                        value.trim().isEmpty) {
                                                      return "Link is required";
                                                    }

                                                    return null;
                                                  },
                                                  cursorColor:
                                                      AppColors.blackColor,
                                                  controller:
                                                      patientInfoController
                                                          .address!,
                                                  decoration: InputDecoration(
                                                    counterText: "",
                                                    labelText:
                                                        "Please Paste Your Link",
                                                    filled: true,
                                                    fillColor:
                                                        AppColors.whiteColor,
                                                    border: OutlineInputBorder(
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
                                                              color: AppColors
                                                                  .primaryColor),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.w),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: AppColors
                                                                    .primaryColor)),
                                                    labelStyle: TextStyle(
                                                        color:
                                                            AppColors.bgColor,
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
                                                                    .sp16.sp),
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
                                                  onFieldSubmitted: (value) {
                                                    if (_formKey.currentState!
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
                                                                  .sp14.sp),
                                                  keyboardType: TextInputType
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
                                height: 4.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CommonButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          common.showCustomSnackBar(
                              "${AppLocalizations.of(context)!.workinprogress}");
                          if (_formKey.currentState!.validate() &&
                              _formKey.currentState!.validate()) {
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
                        width: 90.w,
                        buttonText: AppLocalizations.of(context)!.submit,
                        fontWeight: CommonFontWeight.semiBold,
                        borderRadius: 10,
                        buttonColor: AppColors.bgColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
