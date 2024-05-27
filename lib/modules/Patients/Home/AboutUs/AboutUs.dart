// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:eshop/components/Constants/AppColors.dart';
import 'package:eshop/components/Constants/AppFontFamily.dart';
import 'package:eshop/components/Constants/AppImages.dart';
import 'package:eshop/components/strings/Constants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:eshop/network/endpoints.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class AboutUs extends StatefulWidget {
  const AboutUs({
    super.key,
  });

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  WebViewController? webViewController;
  bool isLoading = true;

  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
            onProgress: (int progress) {
              print("onprogress $progress");
              // Update loading bar.
            },
            onPageStarted: (String url) {
              print("onPageStarted $url");
            },
            onPageFinished: (String url) {
              print("onPageFinished $url");
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            },
            onWebResourceError: (WebResourceError error) {
              print("onWebResourceError $error");
            },
            onNavigationRequest: (NavigationRequest request) {
              return NavigationDecision.navigate;
            },
            onUrlChange: (UrlChange urlchange) {}),
      )
      ..loadRequest(Uri.parse(Endpoints.ABOUTUS));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    webViewController!.loadRequest(Uri.parse('about:blank'));
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            // padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppColors.primaryColor,
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
                        width: 10.w,
                      ),
                      Container(
                        height: 10.h,
                        width: 42.w,
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalizations.of(context)!.aboutus,
                          style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                            fontSize: CommonFontSizes.sp18.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 85.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.blackColor.withOpacity(
                          .2), // You can set the color of the border
                      width: 1.0, // You can set the width of the border
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.1),
                        spreadRadius: 2.0,
                        blurRadius: 8.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.blackColor,
                        ))
                      : WebViewWidget(
                          controller: webViewController!,
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
