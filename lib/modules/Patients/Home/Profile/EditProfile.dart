import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/CommonExt/Components.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eshop/components/strings/Constants.dart';
import 'package:eshop/modules/Patients/Home/Profile/ProfileController.dart';

import 'ProfileController.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  XFile? profileImage = XFile("");
  File? _image;

  final _formKey = GlobalKey<FormState>();

  String? language;
  var profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.getUserById();
    profileController.getStringValuesSF();
  }

  // showPhotoSelectionPanel(context) {
  //   showModalBottomSheet<void>(
  //     // context and builder are
  //     // required properties in this widget
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: AppColors.whiteColor,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
  //     ),
  //     builder: (BuildContext context) {
  //       return Padding(
  //         padding:
  //             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
  //         child: const PhotoSelectionPanel(),
  //       );
  //     },
  //   );
  // }
  File? _selectedImage;

  void setImage(File image) {
    setState(() {
      _selectedImage = image;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: source, imageQuality: 50);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
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
                child: Stack(children: [
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
                                offset:
                                    Offset(0, 6), // changes position of shadow
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
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.applicantId,
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
                                        '${profileController!.applicantId.value!}',
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
                                  height: 2,
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
                                        '${profileController!.name.value!}',
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
                                        '${profileController!.phone.value!}',
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
                                        '${profileController!.email.value!}',
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
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .nameEdit,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight:
                                                CommonFontWeight.regular,
                                            fontSize: CommonFontSizes.sp16.sp,
                                            color: AppColors.blackColor
                                                .withOpacity(.9),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: .5.h,
                                      ),
                                      TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        validator: (value) {
                                          // if (isSignupButtonActive) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .nameisrequired;
                                          }

                                          return null;
                                          // }
                                        },
                                        cursorColor: AppColors.blackColor,
                                        controller:
                                            profileController.nameController!,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColors.whiteColor,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.w),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.w),
                                            borderSide: BorderSide(
                                                color: AppColors.blackColor
                                                    .withOpacity(.5)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.w),
                                              borderSide: const BorderSide(
                                                  color: AppColors.blackColor)),
                                          counterText: "",
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  15, 0, 15, 0),
                                        ),
                                        onChanged: (value) {},
                                        onFieldSubmitted: (value) {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            profileController
                                                .isButtonActive.value = true;
                                          } else {
                                            profileController
                                                .isButtonActive.value = false;
                                          }
                                        },
                                        style: CommonTextStyles
                                            .poppinsMediumStyle
                                            .copyWith(
                                                color: AppColors.blackColor,
                                                fontSize:
                                                    CommonFontSizes.sp16.sp),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .phonenoEdit,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight:
                                                CommonFontWeight.regular,
                                            fontSize: CommonFontSizes.sp16.sp,
                                            color: AppColors.blackColor
                                                .withOpacity(.9),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: .5.h,
                                      ),
                                      TextFormField(
                                        enabled: false,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]")),
                                        ],
                                        validator: (value) {
                                          if (value == "") {
                                            return AppLocalizations.of(context)!
                                                .phonerequired;
                                          }
                                          if (!RegExp("[0-9]")
                                              .hasMatch(value!)) {
                                            return Constants.phoneNumberError;
                                          }

                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          return null;
                                        },
                                        cursorColor: AppColors.blackColor,
                                        controller:
                                            profileController.mobileController,
                                        maxLength: 10,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColors.whiteColor,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.w),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.w),
                                            borderSide: BorderSide(
                                                color: AppColors.blackColor
                                                    .withOpacity(.5)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.w),
                                              borderSide: const BorderSide(
                                                  color: AppColors.blackColor)),
                                          counterText: "",
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  15, 0, 15, 0),
                                        ),
                                        onChanged: (value) {
                                          if (_formKey.currentState != null &&
                                              _formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                        },
                                        onFieldSubmitted: (value) {
                                          // if (_formKey.currentState!.validate()) {
                                          //   print("yes");
                                          // }
                                        },
                                        style: CommonTextStyles
                                            .poppinsMediumStyle
                                            .copyWith(
                                                color: AppColors.blackColor,
                                                fontSize:
                                                    CommonFontSizes.sp16.sp),
                                        keyboardType: TextInputType.phone,
                                      ),
                                      SizedBox(height: 2.h),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .emailEdit,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight:
                                                CommonFontWeight.regular,
                                            fontSize: CommonFontSizes.sp16.sp,
                                            color: AppColors.blackColor
                                                .withOpacity(.9),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: .5.h,
                                      ),
                                      TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        validator: (value) {
                                          // if (isSignupButtonActive) {
                                          if (value == null || value.isEmpty) {
                                            return AppLocalizations.of(context)!
                                                .emailisrequired;
                                          }
                                          if (!RegExp(Constants.emailRegex)
                                              .hasMatch(value)) {
                                            return AppLocalizations.of(context)!
                                                .validemail;
                                          }
                                          return null;
                                          // }
                                        },
                                        cursorColor: AppColors.blackColor,
                                        controller:
                                            profileController.emailController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColors.whiteColor,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.w),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.w),
                                            borderSide: BorderSide(
                                                color: AppColors.blackColor
                                                    .withOpacity(.5)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.w),
                                              borderSide: const BorderSide(
                                                  color: AppColors.blackColor)),
                                          counterText: "",
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  15, 0, 15, 0),
                                        ),
                                        onChanged: (value) {},
                                        onFieldSubmitted: (value) {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            profileController
                                                .isButtonActive.value = true;
                                          } else {
                                            profileController
                                                .isButtonActive.value = false;
                                          }
                                        },
                                        style: CommonTextStyles
                                            .poppinsMediumStyle
                                            .copyWith(
                                                color: AppColors.blackColor,
                                                fontSize:
                                                    CommonFontSizes.sp16.sp),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .languageEdit,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontWeight:
                                                CommonFontWeight.regular,
                                            fontSize: CommonFontSizes.sp16.sp,
                                            color: AppColors.blackColor
                                                .withOpacity(.9),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Radio(
                                            value: 0,
                                            groupValue:
                                                profileController.radio.value,
                                            onChanged: (int? value) {
                                              if (value != null) {
                                                profileController.radio.value =
                                                    value;
                                              }
                                            },
                                            activeColor: AppColors.bgColor,
                                          ),
                                          Text(AppLocalizations.of(context)!
                                              .english),
                                          Radio(
                                            value: 1,
                                            groupValue:
                                                profileController.radio.value,
                                            onChanged: (int? value) {
                                              if (value != null) {
                                                profileController.radio.value =
                                                    value;
                                              }
                                            },
                                            activeColor: AppColors.bgColor,
                                          ),
                                          Text(AppLocalizations.of(context)!
                                              .spanish),
                                        ],
                                      ),
                                      CommonButton(
                                        width: 100.w,
                                        onPressed: () {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            profileController.updateProfile(
                                                profileImage!.path,
                                                profileController
                                                        .nameController.text[0]
                                                        .toUpperCase() +
                                                    profileController
                                                        .nameController.text
                                                        .substring(1)
                                                        .toLowerCase(),
                                                profileController
                                                    .emailController.text
                                                    .toLowerCase(),
                                                profileController.radio.value);
                                          }
                                        },
                                        buttonText:
                                            AppLocalizations.of(context)!
                                                .submit,
                                        buttonColor: AppColors.btnColor,
                                        textColor: AppColors.whiteColor,
                                        fontWeight: CommonFontWeight.semiBold,
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
                  Positioned(
                    left: 36.w,
                    top: 2.h,
                    child: CircleAvatar(
                      // backgroundImage: setBackgroundImage(),
                      backgroundImage: profileImage!.path.isNotEmpty
                          ? FileImage(File(profileImage!.path)) as ImageProvider
                          : NetworkImage(profileController.picture.value != ""
                              ? "${profileController.picture.value}"
                              : AppImages.defaultImage),
                      radius: 12.w,
                      child: Stack(children: [
                        //Camera Icon
                        Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () async {
                                var image = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ImageUploadPopUp();
                                  },
                                );
                                setState(() {
                                  if (image != null) {
                                    profileImage = image;
                                    print(
                                        "Profile image selected: $profileImage");
                                  }
                                });
                              },
                              child: Container(
                                height: 6.w,
                                width: 6.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage(AppImages.profileCameraIcon),
                                  ),
                                ),
                              ),
                            )),
                      ]),
                    ),
                  ),
                ]),
              ),
            ),
          ));
    });
  }
}

class ImageUploadPopUp extends StatefulWidget {
  const ImageUploadPopUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageUploadPopUpState();
}

class _ImageUploadPopUpState extends State<ImageUploadPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select',
        style: CommonTextStyles.poppinsMediumStyle.copyWith(
            color: AppColors.blackColor, fontSize: CommonFontSizes.sp16.sp),
        textAlign: TextAlign.center,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            getImage(ImageSource.camera);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            color: AppColors.whiteColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Camera',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: AppFontFamily.poppins,
                      fontWeight: CommonFontWeight.medium,
                      fontSize: CommonFontSizes.sp16.sp),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            getImage(ImageSource.gallery);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
            color: AppColors.whiteColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.file_upload_rounded,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Gallery',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: AppFontFamily.poppins,
                      fontWeight: CommonFontWeight.medium,
                      fontSize: CommonFontSizes.sp16.sp),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getImage(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: source);
    Navigator.pop(context, image);
  }
}