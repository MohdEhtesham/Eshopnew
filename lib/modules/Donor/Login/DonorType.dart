import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:eshop/components/strings/Constants.dart';
import 'package:eshop/modules/ChangeLang/ChangeLangController.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/modules/Donor/Login/DonorPhoneLoginController.dart';
import '../../../../../components/CommonFunctions/CommonFunctions.dart'
    as common;

class DonorType extends StatefulWidget {
  const DonorType({
    Key? key,
  }) : super(key: key);

  @override
  _DonorTypeState createState() => _DonorTypeState();
}

class _DonorTypeState extends State<DonorType> {
  var changeLangController = Get.put(ChangeLangController());
  var donorPhoneLoginController = Get.put(DonorPhoneLoginController());

  Position? _currentPosition;

  void initState() {
    super.initState();
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
              Container(
                  width: 100.w,
                  height: 45.h,
                  child: Image.asset(
                    AppImages.onlineDoctor,
                    fit: BoxFit.fill,
                  )),
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
                              fontWeight: CommonFontWeight.regular,
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
                            AppLocalizations.of(context)!.typeofdonor,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: CommonFontWeight.semiBold,
                              fontSize: 18.sp,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        GestureDetector(
                          onTap: () async {
                            donorPhoneLoginController
                                .selectType("Directed-Donor");
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
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 5.h,
                                        width: 10.w,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImages.directed),
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
                                              AppLocalizations.of(context)!
                                                  .direct,
                                              softWrap: true,
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    CommonFontSizes.sp16.sp,
                                                color: AppColors.blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 5.h,
                                        width: 10.w,
                                        decoration: const BoxDecoration(),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 60.w,
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .directedtext,
                                                softWrap: true,
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.normal,
                                                  fontSize:
                                                      CommonFontSizes.sp14.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                            common.showCustomSnackBar(
                                AppLocalizations.of(context)!.workinprogress);

                            //  donorPhoneLoginController
                            //     .selectType("Non-Directed-Donor");
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
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 5.h,
                                        width: 10.w,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  AppImages.nonDirected),
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
                                              AppLocalizations.of(context)!
                                                  .nondirect,
                                              softWrap: true,
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    CommonFontSizes.sp16.sp,
                                                color: AppColors.blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 5.h,
                                        width: 10.w,
                                        decoration: const BoxDecoration(),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 60.w,
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .nondirectedtext,
                                                softWrap: true,
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.normal,
                                                  fontSize:
                                                      CommonFontSizes.sp14.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
