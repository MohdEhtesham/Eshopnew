import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'DonorDeleteAccountController.dart';

// ignore: must_be_immutable
class DonorDeleteAccountPanel extends StatefulWidget {
  const DonorDeleteAccountPanel({
    super.key,
  });

  @override
  State<DonorDeleteAccountPanel> createState() =>
      _DonorDeleteAccountPanelState();
}

class _DonorDeleteAccountPanelState extends State<DonorDeleteAccountPanel> {
  var donorDeleteAccountController = Get.put(DonorDeleteAccountController());
  bool isNextPressed = false;
  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleDeleteAccount() async {
    await donorDeleteAccountController.deleteAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => donorDeleteAccountController.confirmDelete.value
          ? Column(
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
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(25.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(AppImages.delete),
                              color: AppColors.primaryColor,
                              width: 6.w,
                              height: 6.w,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!.delete,
                              style: CommonTextStyles.poppinsSemiBoldStyle
                                  .copyWith(
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
                                    AppLocalizations.of(context)!.deletemsg2,
                                    style: CommonTextStyles.poppinsMediumStyle
                                        .copyWith(
                                            color: AppColors.blackColor,
                                            fontSize: 17.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocalizations.of(context)!.verification,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: CommonFontWeight.regular,
                                      fontSize: CommonFontSizes.sp16.sp,
                                      color:
                                          AppColors.blackColor.withOpacity(.9),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextFormField(
                                  autovalidateMode: AutovalidateMode.disabled,
                                  cursorColor: AppColors.blackColor,
                                  controller: donorDeleteAccountController
                                      .otpController,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .otprequired;
                                    }
                                    if (value.length < 6) {
                                      return AppLocalizations.of(context)!
                                          .otpisless;
                                    }
                                    return null;
                                  },
                                  maxLength: 6,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.whiteColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.w),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.w),
                                      borderSide: BorderSide(
                                          color: AppColors.blackColor
                                              .withOpacity(.5)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2.w),
                                      borderSide: BorderSide(
                                          color: AppColors.blackColor),
                                    ),
                                    counterText: "", // Remove counter text
                                    contentPadding:
                                        EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  ),
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.normal,
                                    fontSize: CommonFontSizes.sp16.sp,
                                    color: AppColors.blackColor,
                                  ),
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {
                                    if (_formKey.currentState!.validate()) {
                                      donorDeleteAccountController
                                          .isActiveButton.value = true;
                                    } else {
                                      donorDeleteAccountController
                                          .isActiveButton.value = false;
                                    }
                                  },
                                ),
                                SizedBox(height: 3.h),
                                Row(
                                  children: [
                                    CommonButton(
                                      width: 40.w,
                                      onPressed: () async {
                                        donorDeleteAccountController
                                            .confirmDelete.value = false;
                                        donorDeleteAccountController
                                            .otpController.text = "";
                                        Get.back();
                                      },
                                      buttonText:
                                          AppLocalizations.of(context)!.cancel,
                                      textColor: AppColors.whiteColor,
                                      fontWeight: CommonFontWeight.semiBold,
                                      borderRadius: 5,
                                    ),
                                    Spacer(),
                                    CommonButton(
                                      width: 40.w,
                                      onPressed: () async {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          await donorDeleteAccountController
                                              .verifyPhoneCodeForDelete(
                                                  donorDeleteAccountController
                                                      .otpController.text);
                                        }
                                      },
                                      buttonText:
                                          AppLocalizations.of(context)!.yes,
                                      textColor: AppColors.btnColor,
                                      fontWeight: CommonFontWeight.semiBold,
                                      buttonColor: AppColors.whiteColor,
                                      borderColor: AppColors.btnColor,
                                      borderRadius: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            )
          : Column(
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
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(25.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(AppImages.delete),
                              color: AppColors.primaryColor,
                              width: 6.w,
                              height: 6.w,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!.delete,
                              style: CommonTextStyles.poppinsSemiBoldStyle
                                  .copyWith(
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
                                    style: CommonTextStyles.poppinsSemiBoldStyle
                                        .copyWith(
                                            color: AppColors.blackColor,
                                            fontSize: CommonFontSizes.sp18.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.deletemsg,
                                    style: CommonTextStyles.poppinsMediumStyle
                                        .copyWith(
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
                                    buttonText:
                                        AppLocalizations.of(context)!.cancel,
                                    fontWeight: CommonFontWeight.semiBold,
                                    borderRadius: 5,
                                  ),
                                  const Spacer(),
                                  CommonButton(
                                    onPressed: () {
                                      _handleDeleteAccount();
                                    },
                                    width: 40.w,
                                    buttonText:
                                        AppLocalizations.of(context)!.yes,
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
            ),
    );
  }
}
