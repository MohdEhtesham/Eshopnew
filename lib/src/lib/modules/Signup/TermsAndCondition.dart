// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunlox/components/CommonExt/Components.dart';
import 'package:gunlox/components/Constants/AppColors.dart';
import 'package:gunlox/components/Constants/AppFontFamily.dart';
import 'package:gunlox/components/Constants/AppImages.dart';
import 'package:gunlox/components/strings/Constants.dart';
import 'package:gunlox/modules/Signup/phoneVerification.dart';
import 'package:gunlox/modules/Signup/signupController.dart';
import '../../../components/CommonFunctions/CommonFunctions.dart' as common;
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class TermsAndCondition extends StatefulWidget {
  TermsAndCondition(
      {super.key, required this.phoneNumber, required this.accessToken,
      
     required this.userId});
  String phoneNumber;
  String accessToken;
  String userId;
  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  final _formKey = GlobalKey<FormState>();
  var signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 5.h),
                      Center(
                        child: Container(
                          height: 6.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.splashLogo),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 10.h,
                                width: 10.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppImages.arrow),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              height: 10.h,
                              width: 10.w,
                              alignment: Alignment.center,
                              child: Text(
                                Constants.termsNcon,
                                style:
                                    CommonTextStyles.poppinsBoldStyle.copyWith(
                                  fontSize: CommonFontSizes.sp22.sp,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        height: 60.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors
                                .placeholdercolor, // You can set the color of the border
                            width: 2.0, // You can set the width of the border
                          ),
                        ),

                        child: RawScrollbar(
                          thumbColor: AppColors.silver,
                          radius: Radius.circular(20),
                          thickness: 5,
                          child: SingleChildScrollView(
                            child: Text(
                                " If any provision of these Terms and Conditions is held to be invalid or unenforceable, the provision shall be removed (or interpreted, if possible, in a manner as to be enforceable), and the remaining provisions shall be enforced. Headings are for reference purposes only and in no way define, limit, construe or describe the scope or extent of such section. Our failure to act with respect to a breach by you or others does not waive our right to act with respect to subsequent or similar breaches. These Terms and Conditions set forth the entire understanding and agreement between us with respect to the subject matter contained herein and supersede any other agreement, proposals and communications, written or oral, between our representatives and you with respect to the subject matter hereof, including any terms and conditions on any of customer's documents or purchase orders.for use at other locations outside of the Ukraine and access to them from territories where their contents are illegal is prohibited. If you access this Site from a location outside of the Ukraine, you are responsible for compliance with all local laws."),
                          ),
                        ),
                        // child:WebviewScreen(
                        //                 url:'https://generator.lorem-ipsum.info/terms-and-conditions',
                        //               ),
                        //                     child: WebViewWidget(
                        //                       controller: WebViewController,
                        //   // initialUrl: 'https://generator.lorem-ipsum.info/terms-and-conditions',
                        //   // javascriptMode: JavascriptMode.unrestricted,
                        // ),
                      ),
                      // SizedBox(height: 2.h),
                      Row(
                        children: [
                          Expanded(
                            child: ListTileTheme(
                              horizontalTitleGap: 0.0,
                              child: CheckboxListTile(
                                value: signupController.checkBoxValue.value,
                                onChanged: (value) {
                                  setState(() {
                                    signupController.checkBoxValue.value =
                                        value!;
                                  });
                                },
                                activeColor: AppColors.primaryColor,
                                side: BorderSide(color: AppColors.Blacktext),
                                title: Text(
                                  Constants.iAgree,
                                  style: CommonTextStyles.poppinsRegularStyle
                                      .copyWith(
                                    color: AppColors.Blacktext,
                                    fontSize: CommonFontSizes.sp18.sp,
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                          ),
                        ],
                      ),

                      CommonButton(
                        onPressed: () {
                          if (signupController.checkBoxValue.value) {
                            print("Hello");
                            Get.to(() => PhoneVerification(
                                  phoneNumber: widget.phoneNumber,
                                  accessToken: widget.accessToken,
                                  userId:widget.userId,
                                ));
                          } else {
                            common.showCustomSnackBar(Constants.pleaseAgree);
                          }
                        },
                        buttonText: Constants.conti,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        buttonColor: AppColors.secondaryColor,
                        textColor: AppColors.primaryWhiteColor,
                        horizontalPadding: 20,
                        verticalPadding: 10,
                        borderRadius: 25,
                        iconSpacing: 12,
                        width: 100.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
