import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import '../../../../components/Constants/AppColors.dart';
import '../../../../components/Constants/AppFontFamily.dart';
import '../HomeController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  var homeController = Get.put(HomeController());
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.whiteColor,
            size: 5.w,
          ),
        ),
        title: Text(
          "Search",
          style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
              fontSize: CommonFontSizes.sp18.sp, color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                elevation: 2,
                color: AppColors.primaryColor,
                child: Container(
                    // margin: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.fromLTRB(
                      10.0,
                      10.0,
                      10.0,
                      30.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.whiteColor),
                      borderRadius: BorderRadius.circular(50.0),
                      // shape: BoxShape.circle,
                      color: AppColors.whiteColor.withOpacity(0.5),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.search,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        TextField(
                          cursorColor: AppColors.primaryColor,
                          readOnly: false,
                          controller: _searchController,
                          style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontFamily: AppFontFamily.poppins),
                          decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.transparent),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.transparent),
                              ),
                              hintText:
                                  AppLocalizations.of(context)!.searchhinttext,
                              hintStyle: CommonTextStyles.poppinsRegularStyle
                                  .copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: CommonFontSizes.sp14),
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _searchController.clear();
                                        });
                                      },
                                      child: const Icon(
                                        Icons.close_rounded,
                                        color: AppColors.whiteColor,
                                      ),
                                    )
                                  : null),
                          onChanged: (searchQuery) {
                            homeController
                                .getCentersbyQuery(_searchController.text!);
                          },
                        )
                      ],
                    )),
              ),
              homeController.isLoading.value
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Column(
                            // shrinkWrap: true,
                            // physics: const ScrollPhysics(),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: homeController
                                    .transplantCenterListBySearch.length,
                                physics: const ScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      shadowColor: AppColors.blackColor,
                                      child: Container(
                                        color: AppColors.whiteColor,
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            homeController
                                                        .transplantCenterListBySearch[
                                                            index]
                                                        .type ==
                                                    "Registered"
                                                ? Column(
                                                    children: [
                                                      Container(
                                                        height: 30.0,
                                                        width: 40.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: AppColors
                                                                  .whiteColor),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topRight:
                                                                Radius.circular(
                                                                    40),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    40),
                                                          ),
                                                          // shape: BoxShape.circle,
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .verfied,
                                                            style: CommonTextStyles
                                                                .poppinsSemiBoldStyle
                                                                .copyWith(
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontSize:
                                                                  CommonFontSizes
                                                                      .sp16.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            Row(
                                              children: [
                                                //Image section
                                                Card(
                                                  shadowColor:
                                                      AppColors.blackColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0)),
                                                  elevation: 5.0,
                                                  child: Container(
                                                    height: 22.w,
                                                    width: 22.w,
                                                    decoration: BoxDecoration(
                                                      // image:
                                                      //     const DecorationImage(
                                                      //         image:
                                                      //             AssetImage(
                                                      //           AppImages
                                                      //               .transplantCenterDefault,
                                                      //         ),
                                                      //         fit: BoxFit
                                                      //             .fill),
                                                      image: DecorationImage(
                                                          image: NetworkImage(homeController
                                                                          .transplantCenterListBySearch[
                                                                              index]
                                                                          .profileImage !=
                                                                      null &&
                                                                  homeController
                                                                          .transplantCenterListBySearch[
                                                                              index]
                                                                          .profileImage !=
                                                                      ""
                                                              ? homeController
                                                                  .transplantCenterListBySearch[
                                                                      index]
                                                                  .profileImage!
                                                              : AppImages
                                                                  .defaultImage),
                                                          fit: BoxFit.fill),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),

                                                SizedBox(
                                                  // width: 60.w,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      //Name Label
                                                      SizedBox(
                                                        width: 50.w,
                                                        child: Text(
                                                          "${homeController.transplantCenterListBySearch[index].name!}",
                                                          softWrap: true,
                                                          style: CommonTextStyles
                                                              .poppinsSemiBoldStyle
                                                              .copyWith(
                                                            color: AppColors
                                                                .blackColor,
                                                            fontSize:
                                                                CommonFontSizes
                                                                    .sp16.sp,
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
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: 20.0,
                                                                width: 20.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image: AssetImage(
                                                                        AppImages
                                                                            .locationIconBlack),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 5.0,
                                                              ),
                                                              SizedBox(
                                                                width: 20.w,
                                                                child: Text(
                                                                  homeController
                                                                              .transplantCenterListBySearch[
                                                                                  index]
                                                                              .address !=
                                                                          null
                                                                      ? homeController
                                                                          .transplantCenterListBySearch[
                                                                              index]
                                                                          .address!
                                                                          .substring(
                                                                              0,
                                                                              homeController.transplantCenterListBySearch[index].address.toString().indexOf(
                                                                                  ','))
                                                                      : AppLocalizations.of(
                                                                              context)!
                                                                          .undefined,
                                                                  // "Texas",
                                                                  softWrap:
                                                                      true,
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                height: 20.0,
                                                                width: 20.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image: AssetImage(
                                                                        AppImages
                                                                            .distanceIcon),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 5.0,
                                                              ),
                                                              SizedBox(
                                                                width: 22.w,
                                                                child: Text(
                                                                  homeController
                                                                              .transplantCenterListBySearch[
                                                                                  index]
                                                                              .distance !=
                                                                          null
                                                                      ? "${(homeController.transplantCenterListBySearch[index].distance! / 1000).round()} kms away"
                                                                      : AppLocalizations.of(
                                                                              context)!
                                                                          .undefined,
                                                                  // "5kms away",
                                                                  style: CommonTextStyles
                                                                      .poppinsRegularStyle
                                                                      .copyWith(
                                                                    color: AppColors
                                                                        .blackColor,
                                                                    fontSize:
                                                                        CommonFontSizes
                                                                            .sp14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                      SizedBox(
                                                        height: 1.h,
                                                      ),

                                                      CommonButton(
                                                        width: 50.w,
                                                        onPressed: () {
                                                          //Actions on Apply Button
                                                        },
                                                        buttonText: homeController
                                                                    .transplantCenterListBySearch[
                                                                        index]
                                                                    .type ==
                                                                "Registered"
                                                            ? AppLocalizations
                                                                    .of(
                                                                        context)!
                                                                .apply
                                                            : AppLocalizations
                                                                    .of(context)!
                                                                .contact,
                                                        textColor: AppColors
                                                            .whiteColor,
                                                        fontWeight:
                                                            CommonFontWeight
                                                                .semiBold,
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
                                  );
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
