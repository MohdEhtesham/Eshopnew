// OnboardingScreen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:eshop/components/strings/Constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/modules/Patients/Login/Login.dart';
import 'package:eshop/utils/SharedPreference.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: 4, // Change to the number of onboarding screens
              itemBuilder: (context, index) {
                List<Map<String, String>> _onboardingData = [
                  {
                    "title": AppLocalizations.of(context)!.title1,
                    "description": AppLocalizations.of(context)!.des1,
                    "image": AppImages.onboardingfirst,
                  },
                  {
                    "title": AppLocalizations.of(context)!.title2,
                    "description": AppLocalizations.of(context)!.des2,
                    "image": AppImages.onBo2,
                  },
                  {
                    "title": AppLocalizations.of(context)!.title3,
                    "description": AppLocalizations.of(context)!.des3,
                    "image": AppImages.onBo3,
                  },
                  {
                    "title": AppLocalizations.of(context)!.title4,
                    "description": AppLocalizations.of(context)!.des4,
                    "image": AppImages.onBo4,
                  },
                ];

                return SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset(
                          AppImages.splashLogo,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    _onboardingData[index]["image"]!),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              _onboardingData[index]["title"]!,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: CommonFontSizes.sp20.sp,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 85.w,
                              child: Text(
                                _onboardingData[index]["description"]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.normal,
                                  fontSize: CommonFontSizes.sp15,
                                  color: AppColors.blackColor.withOpacity(.9),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 85.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            )
          ],
        ),
        floatingActionButton: Container(
          height: 5.h,
          width: 10.w,
          child: InkWell(
            onTap: () async {
              if (_currentPage == 3) {
                // Check if it's the last page
                await TAPrefs.setInt('untilllast', 1);
                Get.offAll(() => const Login());
              } else {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
            child: Icon(Icons.arrow_forward, color: AppColors.primaryColor),
          ),
        ),
      );
    });
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      // Change to the number of onboarding screens
      indicators.add(_indicator(i == _currentPage));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:eshop/components/Constants/AppColors.dart';
// import 'package:eshop/components/Constants/AppFontFamily.dart';
// import 'package:eshop/components/Constants/AppImages.dart';
// import 'package:eshop/components/strings/Constants.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:eshop/modules/Patients/Login/Login.dart';
// import 'package:eshop/utils/SharedPreference.dart';

// import '../Patients/Home/HomeScreen/HomeScreen.dart';

// class OnboardingScreen extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveSizer(builder: (context, orientation, screenType) {
//       return Scaffold(
//         body: Stack(
//           children: [
//             PageView.builder(
//               controller: _pageController,
//               onPageChanged: (index) {
//                 setState(() {
//                   _currentPage = index;
//                 });
//               },
//               itemCount: 4, // Change to the number of onboarding screens
//               itemBuilder: (context, index) {
//                 List<Map<String, String>> _onboardingData = [
//                   {
//                     "title": AppLocalizations.of(context)!.title1,
//                     "description": AppLocalizations.of(context)!.des1,
//                     "image": AppImages.onboardingfirst,
//                   },
//                   {
//                     "title": AppLocalizations.of(context)!.title2,
//                     "description": AppLocalizations.of(context)!.des2,
//                     "image": AppImages.onBo2,
//                   },
//                   {
//                     "title": AppLocalizations.of(context)!.title3,
//                     "description": AppLocalizations.of(context)!.des3,
//                     "image": AppImages.onBo3,
//                   },
//                   {
//                     "title": AppLocalizations.of(context)!.title4,
//                     "description": AppLocalizations.of(context)!.des4,
//                     "image": AppImages.onBo4,
//                   },
//                 ];

//                 return SafeArea(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.asset(
//                         AppImages.splashLogo,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             alignment: Alignment.center,
//                             height: 50.h,
//                             width: 100.w,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                     _onboardingData[index]["image"]!),
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                           ),
//                           Center(
//                             child: Text(
//                               _onboardingData[index]["title"]!,
//                               style: TextStyle(
//                                 fontFamily: "Poppins",
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: CommonFontSizes.sp20.sp,
//                                 color: AppColors.blackColor,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             _onboardingData[index]["description"]!,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             Positioned(
//               left: 0,
//               right: 0,
//               top: 90.h,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: _buildPageIndicator(),
//               ),
//             )
//           ],
//         ),
//         floatingActionButton: Container(
//           height: 5.h,
//           width: 10.w,
//           child: InkWell(
//             onTap: () async {
//               if (_currentPage == 3) {
//                 // Check if it's the last page
//                 await TAPrefs.setInt('untilllast', 0);

//                 Get.offAll(() => const Login());
//               } else {
//                 _pageController.nextPage(
//                   duration: Duration(milliseconds: 500),
//                   curve: Curves.ease,
//                 );
//               }
//             },
//             child: Icon(Icons.arrow_forward, color: AppColors.primaryColor),
//           ),
//         ),
//       );
//     });
//   }

//   List<Widget> _buildPageIndicator() {
//     List<Widget> indicators = [];
//     for (int i = 0; i < 4; i++) {
//       // Change to the number of onboarding screens
//       indicators.add(_indicator(i == _currentPage));
//     }
//     return indicators;
//   }

//   Widget _indicator(bool isActive) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8.0),
//       height: 8,
//       width: 8,
//       decoration: BoxDecoration(
//         color: isActive ? AppColors.primaryColor : Colors.grey,
//         borderRadius: BorderRadius.all(Radius.circular(4)),
//       ),
//     );
//   }
// }
