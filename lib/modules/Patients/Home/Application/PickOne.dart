// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/modules/Patients/Home/Application/ApplicationController.dart';
import 'package:eshop/modules/Patients/Home/Application/PatientInformation.dart';

// ignore: must_be_immutable
class PickOne extends StatefulWidget {
  const PickOne({
    super.key,
  });

  @override
  State<PickOne> createState() => _PickOneState();
}

class _PickOneState extends State<PickOne> {
  var applicationController = Get.put(ApplicationController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SafeArea(
          child: Container(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 4.h,
                        width: 20.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.arrow),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 10.h,
                      width: 50.w,
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.application,
                        style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                          fontSize: CommonFontSizes.sp20.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.whiteColor,
                  border: Border.all(
                    color: AppColors.blackColor.withOpacity(0.2),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppLocalizations.of(context)!.considerfor,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: CommonFontWeight.semiBold,
                            fontSize: 20.sp,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          applicationController.pickOneValue("Kidney");
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
                                        image: AssetImage(AppImages.kidney),
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
                                        AppLocalizations.of(context)!.kidney,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          fontSize: CommonFontSizes.sp16.sp,
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
                        height: 2.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          applicationController.pickOneValue("Kidney/Pancreas");
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
                                        image:
                                            AssetImage(AppImages.kidneyPancres),
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
                                            .kidneyPancreas,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          fontSize: CommonFontSizes.sp16.sp,
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
                        height: 2.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          applicationController.pickOneValue("Pancreas");
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
                                        image: AssetImage(AppImages.pancres),
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
                                        AppLocalizations.of(context)!.pancreas,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          fontSize: CommonFontSizes.sp16.sp,
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
              )
            ]),
          ),
        ),
      );
    });
  }
}
