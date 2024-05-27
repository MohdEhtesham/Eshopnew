// import 'package:flutter/material.dart';
// import 'package:gunlox/components/Constants/AppColors.dart';
// import 'package:gunlox/network/endpoints.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../components/Constants/AppFontFamily.dart';
// import '../../components/Constants/AppImages.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// class WebviewScreen extends StatefulWidget {
//   const WebviewScreen({Key? key, required this.url}) : super(key: key);
//   final String url;

//   @override
//   State<WebviewScreen> createState() => _WebviewScreenState();
// }

// class _WebviewScreenState extends State<WebviewScreen> {
//   final _key = UniqueKey();
//   WebViewController? webViewController;
//   bool isLoading = true;
//   var loadingPercentage = 0;
//   @override
//   void initState() {
//     print("widget url-- ${widget.url}");

//     webViewController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(onProgress: (int progress) {
//           print("onprogress $progress");
//           setState(() {
//             loadingPercentage = progress;
//           });
//           // Update loading bar.
//         }, onPageStarted: (String url) {
//           print("onPageStarted $url");
//         }, onPageFinished: (String url) {
//           print("onPageFinished $url");
//           setState(() {
//             isLoading = false;
//           });
//         }, onWebResourceError: (WebResourceError error) {
//           print("onWebResourceError $error");
//         }, onNavigationRequest: (NavigationRequest request) {
//           if (request.url.startsWith('https://www.youtube.com/')) {
//             return NavigationDecision.prevent;
//           }
//           print("NavigationDecision.navigate");

//           return NavigationDecision.navigate;
//         }, onUrlChange: (UrlChange urlchange) {
//           print("onUrlChange ${urlchange.url} && ${Endpoints.BANNER_IMAGE_BASE_URL}/");

//           if (urlchange.url == "${Endpoints.BANNER_IMAGE_BASE_URL}/") {
//             Navigator.pop(context, true);
//           }

//           // Get.back();
//         }),
//       )
//       ..loadRequest(Uri.parse(widget.url));

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: AppColors.primaryWhiteColor,
//           automaticallyImplyLeading: true,
//           leading: GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: AppColors.primaryColor,
//               size: 5.w,
//             ),
//           ),
//           title: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image(
//                 image: AssetImage(AppImages.lock),
//                 color: AppColors.primaryColor,
//                 width: 5.w,
//                 height: 5.w,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
           
//             ],
//           ),
//           centerTitle: true,
//         ),
//         backgroundColor: AppColors.primaryWhiteColor,
//         body: isLoading
//             ? Center(
//                 child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 4.w),
//                     child: CircularPercentIndicator(
//                       radius: 8.w,
//                       lineWidth: 2.w,
//                       animation: true,
//                       percent: loadingPercentage / 100,
//                       center: Text(
//                         "$loadingPercentage%",
//                         style: CommonTextStyles.poppinsRegularStyle.copyWith(
//                             color: AppColors.primaryBlackColor,
//                             fontSize: CommonFontSizes.sp16),
//                       ),
//                       backgroundColor: AppColors.secondaryColor,
//                       circularStrokeCap: CircularStrokeCap.round,
//                       progressColor: AppColors.primaryColor,
//                     )),
//               )
//             : Column(
//                 children: [
//                   Expanded(
//                     child: WebViewWidget(
//                       controller: webViewController!,
//                     ),
//                   )
//                 ],
//               ),
//       ),
//     );
//   }
// }
