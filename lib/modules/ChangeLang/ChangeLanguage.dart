import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:eshop/components/strings/Constants.dart';
import 'package:eshop/modules/ChangeLang/ChangeLangController.dart';
import 'package:eshop/modules/OnboardingScreen/OnboardingScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import '/../components/CommonFunctions/CommonFunctions.dart' as common;

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  var changeLangController = Get.put(ChangeLangController());
  bool granted = false;

  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      Future.delayed(const Duration(seconds: 1), () {
        common.checkIsLocationServiceEnabled();
      });
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
              "Location Permission Required",
              softWrap: true,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: CommonFontWeight.semiBold,
                fontSize: CommonFontSizes.sp18.sp,
                color: AppColors.blackColor,
              ),
            ),
            content: Text(
              "We require access to your device's location to efficiently locate nearby transplant centers. This permission is crucial for our app to provide you with accurate and timely information regarding transplant facilities in your vicinity. Your location data will solely be used for this purpose and will not be shared with any third parties. Ensuring your safety and convenience is our top priority. Thank you for understanding.",
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
                  "Allow",
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: CommonFontWeight.regular,
                    fontSize: CommonFontSizes.sp16.sp,
                    color: AppColors.bgColor,
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
                    setState(() {
                      granted = true;
                    });
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
    setState(() {
      granted = true;
    });
    return true;
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Location Permission Denied",
            softWrap: true,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: CommonFontWeight.semiBold,
              fontSize: CommonFontSizes.sp18.sp,
              color: AppColors.blackColor,
            ),
          ),
          content: Text(
            "Location permission is required to access the app's functionality.",
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
                  color: const Color.fromARGB(255, 25, 44, 44),
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
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Image.asset(AppImages.hiLogo),
              Expanded(
                child: Container(
                  width: 100.w,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Constants.welcome,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.normal,
                              fontSize: 18.sp,
                              color: AppColors.blackColor.withOpacity(.7),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Constants.chooseLanEn,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Constants.chooseLanEs,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: const Color.fromARGB(255, 54, 24, 24),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (granted) {
                              await changeLangController
                                  .changeLanguageEnglish();
                            } else {
                              _getCurrentPosition();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.whiteColor,
                              border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.2),
                                width: 1.0,
                              ),
                            ),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Container(
                                    height: 5.h,
                                    width: 10.w,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(AppImages.flagEn),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Constants.english,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (granted) {
                              await changeLangController
                                  .changeLanguageSpanish();
                            } else {
                              _getCurrentPosition();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.whiteColor,
                              border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.2),
                                width: 1.0,
                              ),
                            ),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Container(
                                    height: 5.h,
                                    width: 10.w,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(AppImages.flagEn),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Constants.spanish,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}







// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:eshop/components/Constants/AppColors.dart';
// import 'package:eshop/components/Constants/AppFontFamily.dart';
// import 'package:eshop/components/Constants/AppImages.dart';
// import 'package:eshop/components/strings/Constants.dart';
// import 'package:eshop/modules/ChangeLang/ChangeLangController.dart';
// import 'package:eshop/modules/OnboardingScreen/OnboardingScreen.dart';

// class ChangeLanguage extends StatefulWidget {
//   const ChangeLanguage({Key? key}) : super(key: key);

//   @override
//   _ChangeLanguageState createState() => _ChangeLanguageState();
// }

// class _ChangeLanguageState extends State<ChangeLanguage> {
//   var changeLangController = Get.put(ChangeLangController());
//   bool granted = false;

//   Position? _currentPosition;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentPosition();
//   }

//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location services are disabled. Please enable the services')));
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       // Show a dialog to prompt the user to allow location permission within the app
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Location Permission Required"),
//             content: Text(
//                 "Location permission is required to access the app's functionality."),
//             actions: <Widget>[
//               TextButton(
//                 child: Text("Allow"),
//                 onPressed: () async {
//                   Navigator.of(context).pop();
//                   // Request location permission again within the app
//                   await Geolocator.requestPermission();
//                   // Check again after requesting permission
//                   await _getCurrentPosition();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//       return false;
//     }
//     if (permission == LocationPermission.deniedForever) {
//       // Show a dialog explaining why the permission is required and redirect to app settings
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Location Permission Required"),
//             content: Text(
//                 "Location permission is permanently denied. Please allow the location permission in the device settings to access the app's functionality."),
//             actions: <Widget>[
//               TextButton(
//                 child: Text("Go to Settings"),
//                 onPressed: () async {
//                   Navigator.of(context).pop();
//                   // Open app settings

//                   await Geolocator.openAppSettings();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//       return false;
//     }
//     setState(() {
//       granted = true;
//     });
//     return true;
//   }

//   Future<void> _getCurrentPosition() async {
//     final hasPermission = await _handleLocationPermission();
//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() => _currentPosition = position);
//       changeLangController.getUserLocationDetails(_currentPosition!);
//     }).catchError((e) {
//       debugPrint(e.toString());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveSizer(builder: (context, orientation, screenType) {
//       return Scaffold(
//         backgroundColor: AppColors.primaryColor,
//         body: SafeArea(
//           bottom: false,
//           child: Column(
//             children: [
//               Image.asset(AppImages.hiLogo),
//               Expanded(
//                 child: Container(
//                   width: 100.w,
//                   decoration: const BoxDecoration(
//                     color: AppColors.whiteColor,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(25.0),
//                     child: Column(
//                       children: [
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             Constants.welcome,
//                             style: TextStyle(
//                               fontFamily: "Poppins",
//                               fontWeight: FontWeight.normal,
//                               fontSize: 18.sp,
//                               color: AppColors.blackColor.withOpacity(.7),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             Constants.chooseLanEn,
//                             style: TextStyle(
//                               fontFamily: "Poppins",
//                               fontWeight: FontWeight.w600,
//                               fontSize: 18.sp,
//                               color: AppColors.blackColor,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                         Container(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             Constants.chooseLanEs,
//                             style: TextStyle(
//                               fontFamily: "Poppins",
//                               fontWeight: FontWeight.w600,
//                               fontSize: 18.sp,
//                               color: const Color.fromARGB(255, 54, 24, 24),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                             if (granted) {
//                               await changeLangController
//                                   .changeLanguageEnglish();
//                             } else {
//                               _getCurrentPosition();
//                             }
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.0),
//                               color: AppColors.whiteColor,
//                               border: Border.all(
//                                 color: AppColors.blackColor.withOpacity(0.2),
//                                 width: 1.0,
//                               ),
//                             ),
//                             child: ListTile(
//                               title: Row(
//                                 children: [
//                                   Container(
//                                     height: 5.h,
//                                     width: 10.w,
//                                     decoration: const BoxDecoration(
//                                       image: DecorationImage(
//                                           image: AssetImage(AppImages.flagEn),
//                                           fit: BoxFit.cover),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 5.w,
//                                   ),
//                                   SizedBox(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           Constants.english,
//                                           softWrap: true,
//                                           style: TextStyle(
//                                             fontFamily: "Poppins",
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 16.sp,
//                                             color: AppColors.blackColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                            if (granted) {
//                               await changeLangController
//                                   .changeLanguageSpanish();
//                             } else {
//                               _getCurrentPosition();
//                             }},
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.0),
//                               color: AppColors.whiteColor,
//                               border: Border.all(
//                                 color: AppColors.blackColor.withOpacity(0.2),
//                                 width: 1.0,
//                               ),
//                             ),
//                             child: ListTile(
//                               title: Row(
//                                 children: [
//                                   Container(
//                                     height: 5.h,
//                                     width: 10.w,
//                                     decoration: const BoxDecoration(
//                                       image: DecorationImage(
//                                           image: AssetImage(AppImages.flagEs),
//                                           fit: BoxFit.cover),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 5.w,
//                                   ),
//                                   SizedBox(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           Constants.spanish,
//                                           softWrap: true,
//                                           style: TextStyle(
//                                             fontFamily: "Poppins",
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 16.sp,
//                                             color: AppColors.blackColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
