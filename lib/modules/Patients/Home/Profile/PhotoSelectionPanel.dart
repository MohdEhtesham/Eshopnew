import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:eshop/modules/Patients/Home/Profile/ProfileController.dart';

import 'ProfileController.dart';

// ignore: must_be_immutable
class PhotoSelectionPanel extends StatefulWidget {
  final Function(File) setImage;
  PhotoSelectionPanel({super.key, required this.setImage});

  @override
  State<PhotoSelectionPanel> createState() => _PhotoSelectionPanelState();
}

class _PhotoSelectionPanelState extends State<PhotoSelectionPanel> {
  var profileController = Get.put(ProfileController());
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: source, imageQuality: 50);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      widget.setImage(_image!);

      // Show snackbar after image selection
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Image selected'),
        duration: Duration(seconds: 2), // Adjust duration as needed
      ));
    } else {
      // Show snackbar if image selection is canceled
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Image selection canceled'),
        duration: Duration(seconds: 2), // Adjust duration as needed
      ));
    }
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 25,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  AppLocalizations.of(context)!.selectimage,
                  style: CommonTextStyles.poppinsBoldStyle.copyWith(
                      fontWeight: CommonFontWeight.bold,
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
                  Row(
                    children: [
                      CommonButton(
                        onPressed: () {
                          _pickImage(ImageSource.camera);
                        },
                        width: 40.w,
                        fontSize: 16.sp,
                        buttonText: AppLocalizations.of(context)!.camera,
                        fontWeight: CommonFontWeight.semiBold,
                      ),
                      const Spacer(),
                      CommonButton(
                        onPressed: () async {
                          await _pickImage(ImageSource.gallery);
                          Get.back();
                        },
                        width: 40.w,
                        fontSize: 16.sp,
                        buttonText: AppLocalizations.of(context)!.gellery,
                        buttonColor: AppColors.whiteColor,
                        textColor: AppColors.btnColor,
                        borderColor: AppColors.btnColor,
                        fontWeight: CommonFontWeight.semiBold,
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
