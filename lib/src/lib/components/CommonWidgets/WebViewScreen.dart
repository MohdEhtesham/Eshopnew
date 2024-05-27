import 'package:flutter/material.dart';
import 'package:gunlox/components/Constants/AppColors.dart';
import 'package:gunlox/network/endpoints.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/Constants/AppFontFamily.dart';
import '../../components/Constants/AppImages.dart';
import '../../components/strings/Constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final _key = UniqueKey();
  WebViewController? webViewController;

  @override
  void initState() {
    print("widget url-- ${widget.url}");

    webViewController = WebViewController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: webViewController!,
            ),
          )
        ],
      ),
    );
  }
}
