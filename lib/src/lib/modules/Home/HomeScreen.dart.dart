import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunlox/components/CommonExt/Components.dart';
import 'package:gunlox/components/Constants/AppColors.dart';
import 'package:gunlox/components/Constants/AppFontFamily.dart';
import 'package:gunlox/components/Constants/AppImages.dart';
import 'package:gunlox/components/strings/Constants.dart';
import 'package:gunlox/modules/Home/MyAccount.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.accessToken, required this.userId});
  String accessToken;
  String userId;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                GestureDetector(
                  onTap: () {
                    Get.to(MyAccount(
                      accessToken:widget.accessToken, 
                      userId: widget.userId,

                    ));
                  },
                  child: Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.useracc),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 20.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.sheild),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 20.h,
                  width: 90.w,
                  child: Center(
                    child: Text(Constants.Homeword,
                        style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                          fontSize: CommonFontSizes.sp22.sp,
                          color: AppColors.BlackColor,
                        )),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 20.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.gunLock),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            CommonButton(
              onPressed: () {},
              buttonText: Constants.addFirm,
              fontSize: 20,
              imagePath: AppImages.plus,
              fontFamily: "Poppins",
              buttonColor: AppColors.secondaryColor,
              textColor: AppColors.primaryWhiteColor,
              horizontalPadding: 20,
              verticalPadding: 10,
              borderRadius: 25,
              iconSpacing: 12,
              borderColor: Colors.red,
              width: 90.w,
              fontWeight: CommonFontWeight.semiBold,
            ),
          ],
        ),
      ),
    );
  }
}
