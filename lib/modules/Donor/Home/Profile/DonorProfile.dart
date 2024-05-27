import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/modules/Donor/DonorDeleteAccount/DonorDeleteAccount.dart';
import 'package:eshop/modules/Donor/Home/DonorAboutUs/DonorAboutUs.dart';
import 'package:eshop/modules/Donor/Home/DonorContactUs/DonorContactUs.dart';
import 'package:eshop/modules/Donor/Home/DonorPrivacy/DonorPrivacy.dart';
import 'package:eshop/modules/Donor/Home/Profile/DonorEditProfile.dart';
import 'package:eshop/modules/Donor/Home/Profile/DonorLogoutAccountPannel.dart';
import 'package:eshop/modules/Donor/Home/Profile/DonorProfileController.dart';
import 'package:eshop/modules/Patients/Home/Application/PickOne.dart';

class DonorProfile extends StatefulWidget {
  const DonorProfile({super.key});

  @override
  State<DonorProfile> createState() => _DonorProfileState();
}

class _DonorProfileState extends State<DonorProfile> {
  var donorProfileController = Get.put(DonorProfileController());

  showDeleteAccountPanel(context) {
    showModalBottomSheet<void>(
      // context and builder are
      // required properties in this widget
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const DonorDeleteAccountPanel(),
        );
      },
    );
  }

  showlogoutAccountPanel(context) {
    showModalBottomSheet<void>(
      // context and builder are
      // required properties in this widget
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const DonorLogoutAccountPannel(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    donorProfileController.getUserById();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Obx(
            () => Scaffold(
              backgroundColor: AppColors.bgColor,
              body: SafeArea(
                bottom: false,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.whiteColor,
                                size: 4.h,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Center(
                          child: Container(
                            width: 90.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(
                                      0, 6), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.whiteColor,
                              border: Border.all(
                                color: AppColors.blackColor.withOpacity(0.2),
                                width: 1.0,
                              ),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(10),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const DonorEditProfile());
                                    },
                                    child: Image.asset(
                                      AppImages.edit,
                                      height: 3.h,
                                      width: 100.w,
                                      alignment: Alignment.centerRight,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.name,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: CommonFontWeight.regular,
                                          fontSize: CommonFontSizes.sp16.sp,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${donorProfileController!.name.value!}',
                                          softWrap: true,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: CommonFontSizes.sp16.sp,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.phoneno,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: CommonFontWeight.regular,
                                          fontSize: CommonFontSizes.sp16.sp,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${donorProfileController!.phone.value!}',
                                          softWrap: true,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: CommonFontSizes.sp16.sp,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.email,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: CommonFontWeight.regular,
                                          fontSize: CommonFontSizes.sp16.sp,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${donorProfileController!.email.value!}',
                                          softWrap: true,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: CommonFontSizes.sp16.sp,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),

                                  //  Row(
                                  //   children: [
                                  //     Text(
                                  //       AppLocalizations.of(context)!.id,
                                  //       softWrap: true,
                                  //       style: TextStyle(
                                  //         fontFamily: "Poppins",
                                  //         fontWeight: CommonFontWeight.regular,
                                  //         fontSize: CommonFontSizes.sp16.sp,
                                  //         color: AppColors.blackColor,
                                  //       ),
                                  //     ),
                                  //     Expanded(
                                  //       child: Text(
                                  //         '${donorProfileController!.userId.value!}',
                                  //         softWrap: true,
                                  //         style: TextStyle(
                                  //           fontFamily: "Poppins",
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: CommonFontSizes.sp16.sp,
                                  //           color: AppColors.blackColor,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // const SizedBox(
                                  //   height: 3,
                                  // ),

                                  Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.language,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: CommonFontWeight.regular,
                                          fontSize: CommonFontSizes.sp16.sp,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          donorProfileController!
                                                      .Language.value! ==
                                                  "en"
                                              ? AppLocalizations.of(context)!
                                                  .english
                                              : AppLocalizations.of(context)!
                                                  .spanish,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                            fontSize: CommonFontSizes.sp16.sp,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
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
                            // child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const PickOne());
                                    },
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 100.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          AppImages
                                                              .application),
                                                      fit: BoxFit.contain),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 2
                                                      .w), // Adjust the width as per your requirement
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .application,
                                                style: CommonTextStyles
                                                    .poppinsRegularStyle
                                                    .copyWith(
                                                  fontSize:
                                                      CommonFontSizes.sp18.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 3.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.forward),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 2.h,
                                    color: AppColors.blackColor.withOpacity(.2),
                                    // Set the color of the underline
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => DonorContactUs());
                                    },
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 100.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.contact),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 2
                                                      .w), // Adjust the width as per your requirement
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .contactus,
                                                style: CommonTextStyles
                                                    .poppinsRegularStyle
                                                    .copyWith(
                                                  fontSize:
                                                      CommonFontSizes.sp18.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 3.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.forward),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 2.h,
                                    color: AppColors.blackColor.withOpacity(.2),
                                    // Set the color of the underline
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => DonorAboutUs());
                                    },
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 100.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.about),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 2
                                                      .w), // Adjust the width as per your requirement
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .aboutus,
                                                style: CommonTextStyles
                                                    .poppinsRegularStyle
                                                    .copyWith(
                                                  fontSize:
                                                      CommonFontSizes.sp18.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 3.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.forward),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 2.h,
                                    color: AppColors.blackColor.withOpacity(.2),
                                    // Set the color of the underline
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const DonorPrivacy());
                                    },
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 100.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.privacy),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 2
                                                      .w), // Adjust the width as per your requirement
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .privacy,
                                                style: CommonTextStyles
                                                    .poppinsRegularStyle
                                                    .copyWith(
                                                  fontSize:
                                                      CommonFontSizes.sp18.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 3.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.forward),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 2.h,
                                    color: AppColors.blackColor.withOpacity(.2),
                                    // Set the color of the underline
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDeleteAccountPanel(context);
                                      print("Deleting account");
                                    },
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 100.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        AppImages.delete),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: 2
                                                      .w), // Adjust the width as per your requirement
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .delete,
                                                style: CommonTextStyles
                                                    .poppinsRegularStyle
                                                    .copyWith(
                                                  fontSize:
                                                      CommonFontSizes.sp18.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 3.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.forward),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 2.h,
                                    color: AppColors.blackColor.withOpacity(.2),
                                    // Set the color of the underline
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showlogoutAccountPanel(context);
                                    },
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 100.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 3.h,
                                                width: 10.w,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          AppImages.logout),
                                                      fit: BoxFit.contain),
                                                ),
                                              ),
                                              // Image.asset(
                                              //   AppImages.logout,
                                              //   fit: BoxFit.contain,
                                              //   width: 6.w,
                                              // ),
                                              SizedBox(
                                                  width: 2
                                                      .w), // Adjust the width as per your requirement
                                              Text(
                                                AppLocalizations.of(context)!
                                                    .logout,
                                                style: CommonTextStyles
                                                    .poppinsRegularStyle
                                                    .copyWith(
                                                  fontSize:
                                                      CommonFontSizes.sp18.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 3.h,
                                            width: 10.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.forward),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 2.h,
                                    color: AppColors.blackColor.withOpacity(.2),
                                    // Set the color of the underline
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Positioned(
                      left: 36.w,
                      top: 2.h,
                      child: CircleAvatar(
                        radius: 12.w,
                        child: ClipOval(
                          child: SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: donorProfileController.picture.value != ""
                                ? Image.network(
                                    "${donorProfileController!.picture!.value}",
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null)
                                        return child; // Return the child (image) if loading is complete
                                      else
                                        return Center(
                                          child:
                                              CircularProgressIndicator(), // Show loader while loading
                                        );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        AppImages.defaultImage,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  )
                                : Center(
                                    child:
                                        CircularProgressIndicator(), // Show loader if no picture URL is available
                                  ),
                          ),
                        ),
                      ),
                    ),

//                     Positioned(
//   left: 36.w,
//   top: 2.h,
//   child: CircleAvatar(
//     radius: 12.w,
//     child: ClipOval(
//       child: SizedBox(
//         width: 24.w,
//         height: 24.w,
//         child: donorProfileController.picture.value != ""
//             ? Image.network(
//                 "${donorProfileController!.picture!.value}",
//                 fit: BoxFit.cover,
//                 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                   if (loadingProgress == null)
//                     return child; // Return the child (image) if loading is complete
//                   else
//                     return Center(
//                       child: CircularProgressIndicator(), // Show loader while loading
//                     );
//                 },
//               )
//             : Image.asset(
//                 AppImages.defaultImage,
//                 fit: BoxFit.cover,
//               ),
//       ),
//     ),
//   ),
// ),

                    // Positioned(
                    //   left: 36.w,
                    //   top: 2.h,
                    //   child: CircleAvatar(
                    //     // backgroundImage: setBackgroundImage(),
                    //     backgroundImage: NetworkImage(
                    //         donorProfileController.picture.value != ""
                    //             ? "${donorProfileController.picture.value}"
                    //             : AppImages.defaultImage),
                    //     radius: 12.w,
                    //     child: Stack(children: []),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
