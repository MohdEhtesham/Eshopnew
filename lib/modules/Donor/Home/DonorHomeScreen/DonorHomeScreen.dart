import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/modules/Donor/Home/DonorHomeController.dart';
import 'package:eshop/modules/Donor/Home/DonorHomeScreen/CustomApplicationStatus.dart';
import 'package:eshop/modules/Donor/Home/Profile/DonorProfile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/utils/SharedPreference.dart';
import '../../../../components/CommonExt/Components.dart';
import '../../../../components/Constants/AppColors.dart';
import '../../../../components/Constants/AppFontFamily.dart';
import '../../../../components/Constants/AppImages.dart';
import '../../../ChangeLang/ChangeLangController.dart';
import '../../../../../components/CommonFunctions/CommonFunctions.dart'
    as common;

class DonorHomeScreen extends StatefulWidget {
  const DonorHomeScreen({super.key});

  @override
  State<DonorHomeScreen> createState() => _DonorHomeScreenState();
}

class _DonorHomeScreenState extends State<DonorHomeScreen> {
  bool loading = false;
  var homeController = Get.put(DonorHomeController());
  var changeLangController = Get.put(ChangeLangController());
  Position? _currentPosition;
  @override
  void initState() {
    _getCurrentPosition();
    Future.delayed(const Duration(seconds: 1), () {
      getUserLanguage();
    });
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

  getUserLanguage() async {
    var value;

    value = await TAPrefs.getInt('language');

    if (value == 0) {
      changeLangController.changeLanguageEnglishFromProfile();
    } else {
      changeLangController.changeLanguageSpanishFromProfile();
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
      // Future.delayed(const Duration(seconds: 1), () {
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
                  Get.to(() => const DonorProfile());
                },
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  margin: const EdgeInsets.only(right: 15.0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.profileIcon),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Obx(
            () => SingleChildScrollView(
              child: Container(
                color: AppColors.whiteColor,
                child: Column(
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    homeController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          )
                        : Container(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                homeController.isComplete.value
                                    ? Center(
                                        child: Container(
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: AppColors.bgColor
                                                .withOpacity(.1),
                                            border: Border.all(
                                              color: AppColors.blackColor
                                                  .withOpacity(0.2),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            title: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .recipientname,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            CommonFontWeight
                                                                .regular,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp16.sp,
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Arpit',
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .recipientApplicationId,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            CommonFontWeight
                                                                .regular,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp16.sp,
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '12AP4R5',
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .donorsmedidicalinfo,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            CommonFontWeight
                                                                .regular,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp16.sp,
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'kidney',
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Container(
                                          width: 90.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: AppColors.bgColor
                                                .withOpacity(.1),
                                            border: Border.all(
                                              color: AppColors.blackColor
                                                  .withOpacity(0.2),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            title: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .recipientname,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            CommonFontWeight
                                                                .regular,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp16.sp,
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Aprit',
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .recipientApplicationId,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            CommonFontWeight
                                                                .regular,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp16.sp,
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'AP23j41W',
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .donorsmedidicalinfo,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontWeight:
                                                            CommonFontWeight
                                                                .regular,
                                                        fontSize:
                                                            CommonFontSizes
                                                                .sp16.sp,
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Kidney',
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                CommonButton(
                                                  width: 100.w,
                                                  onPressed: () {
                                                    common.showCustomSnackBar(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .workinprogress);
                                                  },
                                                  buttonText:
                                                      AppLocalizations.of(
                                                              context)!
                                                          .resume,
                                                  buttonColor:
                                                      AppColors.btnColor,
                                                  textColor:
                                                      AppColors.whiteColor,
                                                  fontWeight:
                                                      CommonFontWeight.semiBold,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                homeController.isApplicationDataRetrieved.value
                                    ? homeController.applicationList.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .applications,
                                                  style: CommonTextStyles
                                                      .poppinsSemiBoldStyle
                                                      .copyWith(
                                                    color: AppColors.blackColor,
                                                    fontSize:
                                                        CommonFontSizes.sp16.sp,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                // height: 53.h,
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: homeController
                                                      .transplantCenterList
                                                      .length,
                                                  physics:
                                                      const ScrollPhysics(),
                                                  itemBuilder:
                                                      ((context, index) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .transparent),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        // color: Colors.red,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 5.0),
                                                        child: Card(
                                                          elevation: 1.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            side: BorderSide(
                                                              color: AppColors
                                                                  .blackColor
                                                                  .withOpacity(
                                                                      .2),
                                                            ), // Add a border side
                                                          ),
                                                          shadowColor: AppColors
                                                              .blackColor,
                                                          child: Container(
                                                            color: AppColors
                                                                .whiteColor,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(9.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                //Name Label
                                                                SizedBox(
                                                                    height:
                                                                        1.h),
                                                                SizedBox(
                                                                  width: 100.w,
                                                                  child: Text(
                                                                    "Mercy General hospital",
                                                                    softWrap:
                                                                        true,
                                                                    style: CommonTextStyles
                                                                        .poppinsSemiBoldStyle
                                                                        .copyWith(
                                                                      color: AppColors
                                                                          .blackColor,
                                                                      fontSize:
                                                                          CommonFontSizes
                                                                              .sp18
                                                                              .sp,
                                                                    ),
                                                                  ),
                                                                ),

                                                                SizedBox(
                                                                  height: 1.h,
                                                                ),

                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      // width: 50.w,
                                                                      child:
                                                                          Text(
                                                                        "25/04/2023",
                                                                        softWrap:
                                                                            true,
                                                                        style: CommonTextStyles
                                                                            .poppinsMediumStyle
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.blackColor,
                                                                          fontSize: CommonFontSizes
                                                                              .sp14
                                                                              .sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          5.w,
                                                                    ),
                                                                    SizedBox(
                                                                      // width: 50.w,
                                                                      child:
                                                                          Text(
                                                                        "9:30 am",
                                                                        softWrap:
                                                                            true,
                                                                        style: CommonTextStyles
                                                                            .poppinsMediumStyle
                                                                            .copyWith(
                                                                          color:
                                                                              AppColors.blackColor,
                                                                          fontSize: CommonFontSizes
                                                                              .sp14
                                                                              .sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 2.h,
                                                                ),
                                                                const Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    CustomApplicationStatus(
                                                                      status: CustomStatus
                                                                          .shipped,
                                                                    ),
                                                                  ],
                                                                ),

                                                                // SizedBox(height: 1.h),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox()
                                    : const Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                SizedBox(
                                  height: 2.h,
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
      );
    });
  }
}
