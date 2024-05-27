import 'package:flutter/material.dart';
import 'package:gunlox/components/CommonExt/Components.dart';
import 'package:gunlox/components/Constants/AppColors.dart';
import 'package:gunlox/components/Constants/AppFontFamily.dart';
import 'package:gunlox/components/Constants/AppImages.dart';
import 'package:gunlox/components/strings/Constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoLocks extends StatefulWidget {
  const NoLocks({super.key});

  @override
  State<NoLocks> createState() => _NoLocksState();
}

class _NoLocksState extends State<NoLocks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10.h,
                    width: 45.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.splashLogo),
                      ),
                    ),
                  ),
                  Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.useracc),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 5.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.arrow),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10.h,
                    width: 60.w,
                    child: Center(
                      child: Text(Constants.noword,
                          style: CommonTextStyles.poppinsBoldStyle.copyWith(
                            fontSize: CommonFontSizes.sp22.sp,
                            color: AppColors.primaryColor,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.nofind),
                      ),
                    ),
                  ),
                ],
              ),

               Column(
                 children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5.h,
                        width: 85.w,
                        child: Center(
                          child: Text(Constants.findword2,
                              style: CommonTextStyles.poppinsRegularStyle.copyWith(
                                fontSize: CommonFontSizes.sp18.sp,
                                color: AppColors.BlackColor,
                              )),
                        ),
                      )
                    ],
                                 ),
                                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5.h,
                        width: 85.w,
                        child: Center(
                          child: Text(Constants.findword3,
                              style: CommonTextStyles.poppinsRegularStyle.copyWith(
                                fontSize: CommonFontSizes.sp18.sp,
                                color: AppColors.BlackColor,
                              )),
                        ),
                      )
                    ],
                                 ),
                 ],
               ),
             
             ],
          ),
        ),
      ),
    );
  }
}
