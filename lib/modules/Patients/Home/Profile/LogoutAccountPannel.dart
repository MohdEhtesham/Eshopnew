import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:eshop/modules/Patients/Home/Logout/LogoutController.dart';

// ignore: must_be_immutable
class LogoutAccountPannel extends StatefulWidget {
  const LogoutAccountPannel({
    super.key,
  });

  @override
  State<LogoutAccountPannel> createState() => _DeleteAccountPanelState();
}

class _DeleteAccountPanelState extends State<LogoutAccountPannel> {
  var logoutController = Get.put(LogoutController());
  void _handleLogoutAccount() async {
    // await TAPrefs.clearPrefs();
    await logoutController.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Container(
              height: 1.w,
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(AppImages.logout),
                  color: AppColors.primaryColor,
                  width: 6.w,
                  height: 6.w,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  AppLocalizations.of(context)!.logoutaccount,
                  style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                      fontWeight: CommonFontWeight.semiBold,
                      color: AppColors.blackColor,
                      fontSize: CommonFontSizes.sp20.sp),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //are you sure label & description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.rusure,
                        style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                            color: AppColors.blackColor,
                            fontSize: CommonFontSizes.sp18.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        AppLocalizations.of(context)!.logoutmsg,
                        style: CommonTextStyles.poppinsMediumStyle.copyWith(
                            color: AppColors.blackColor,
                            fontSize: CommonFontSizes.sp18.sp),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 5.h,
                  ),

                  //Buttons
                  Row(
                    children: [
                      CommonButton(
                        onPressed: () {
                          Get.back();
                        },
                        width: 40.w,
                        buttonText: AppLocalizations.of(context)!.cancel,
                        fontWeight: CommonFontWeight.semiBold,
                        borderRadius: 5,
                      ),
                      const Spacer(),
                      CommonButton(
                        onPressed: () {
                          _handleLogoutAccount();
                        },
                        width: 40.w,
                        buttonText: AppLocalizations.of(context)!.yes,
                        buttonColor: AppColors.whiteColor,
                        textColor: AppColors.btnColor,
                        borderColor: AppColors.btnColor,
                        fontWeight: CommonFontWeight.semiBold,
                        borderRadius: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
