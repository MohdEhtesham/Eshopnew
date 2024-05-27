import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../components/Constants/AppColors.dart';
import '../../../../components/Constants/AppFontFamily.dart';
import '../../../../components/Constants/AppImages.dart';

class CustomApplicationStatus extends StatefulWidget {
  ///This variable is used to set status of order, this get only enum which is already in a package below example present.
  /// Status.order
  final CustomStatus? status;

  const CustomApplicationStatus({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  State<CustomApplicationStatus> createState() =>
      _CustomApplicationStatusState();
}

class _CustomApplicationStatusState extends State<CustomApplicationStatus>
    with TickerProviderStateMixin {
  ///This is first animation progress bar controller.
  AnimationController? controller;

  ///This is second animation progress bar controller.
  AnimationController? controller2;

  ///This is third animation progress bar controller.
  AnimationController? controller3;

  ///This is conditional variable.
  bool isFirst = false;
  bool isSecond = false;
  bool isThird = false;

  @override
  void initState() {
    if (widget.status?.name == CustomStatus.order.name) {
      ///initialize first controller
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            controller?.stop();
          }
          setState(() {});
        });
    } else if (widget.status?.name == CustomStatus.shipped.name) {
      ///initialize first controller
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            controller?.stop();
            controller2?.stop();
            isFirst = true;
            controller2?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize second controller
      controller2 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller2?.value != null && controller2!.value > 0.99) {
            controller2?.stop();
            controller3?.stop();
            isSecond = true;
            controller3?.forward(from: 0.0);
          }
          setState(() {});
        });
    } else if (widget.status?.name == CustomStatus.outOfDelivery.name ||
        widget.status?.name == CustomStatus.delivered.name) {
      ///initialize first controller
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller?.value != null && controller!.value > 0.99) {
            controller?.stop();
            controller2?.stop();
            controller3?.stop();
            isFirst = true;
            controller2?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize second controller
      controller2 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller2?.value != null && controller2!.value > 0.99) {
            controller2?.stop();
            controller3?.stop();
            isSecond = true;
            controller3?.forward(from: 0.0);
          }
          setState(() {});
        });

      ///initialize third controller
      controller3 = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          if (controller3?.value != null && controller3!.value > 0.99) {
            controller3?.stop();
            isThird = true;
          }
          setState(() {});
        });
    }

    controller?.repeat(reverse: false);
    controller2?.repeat(reverse: false);
    controller3?.repeat(reverse: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: 8.w,
                  alignment: Alignment.center, // This is needed
                  child: Image.asset(
                    AppImages.applicationTick,
                    fit: BoxFit.contain,
                    width: 8.w,
                  ),
                ),
              ],
            ),

            Container(
              height: 2,
              width: 10.w,
              color: AppColors.primaryColor,
            ),
            Container(
              height: 8.w,
              alignment: Alignment.center, // This is needed
              child: Image.asset(
                AppImages.applicationTick,
                fit: BoxFit.contain,
                width: 8.w,
              ),
            ),
            Container(
              height: 2,
              width: 10.w,
              color: AppColors.yellow,
            ),
            //Update needed
            Container(
              height: 8.w,
              alignment: Alignment.center, // This is needed
              child: Image.asset(
                AppImages.applicationPending,
                fit: BoxFit.contain,
                width: 8.w,
              ),
            ),
            Container(
              height: 2,
              width: 10.w,
              color: AppColors.slightlyGrey,
            ),
            //Action pending
            Container(
              height: 8.w,
              alignment: Alignment.center, // This is needed
              child: Image.asset(
                AppImages.applicationNotFilled,
                fit: BoxFit.contain,
                width: 8.w,
              ),
            ),
            Container(
              height: 2,
              width: 10.w,
              color: AppColors.slightlyGrey,
            ),
            Container(
              height: 8.w,
              alignment: Alignment.center, // This is needed
              child: Image.asset(
                AppImages.applicationNotFilled,
                fit: BoxFit.contain,
                width: 8.w,
              ),
            ),
          ],
        ),
        Container(
          width: 85.w, // Adjust width as needed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 1.w),

                width: 13.w,
                child: Text(
                  "Submitted",
                  softWrap: true,
                  style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                      fontSize: CommonFontSizes.sp12.sp,
                      color: AppColors.slightlyGrey),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 3.w),
                width: 13.w,
                child: Text(
                  "Under Review",
                  softWrap: true,
                  style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                      fontSize: CommonFontSizes.sp12.sp,
                      color: AppColors.slightlyGrey),
                ),
              ),
              Container(
                width: 13.w,
                child: Text(
                  "Update Needed",
                  softWrap: true,
                  style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                      fontSize: CommonFontSizes.sp12.sp,
                      color: AppColors.slightlyGrey),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 1.w),
                width: 13.w,
                child: Text(
                  "Action Pending",
                  softWrap: true,
                  style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                      fontSize: CommonFontSizes.sp12.sp,
                      color: AppColors.slightlyGrey),
                ),
              ),
              SizedBox(
                width: 11.w,
                child: Text(
                  "Success",
                  softWrap: true,
                  style: CommonTextStyles.poppinsSemiBoldStyle.copyWith(
                      fontSize: CommonFontSizes.sp12.sp,
                      color: AppColors.slightlyGrey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TextDto {
  String? title;
  String? date;

  TextDto(this.title, this.date);
}

enum CustomStatus { order, shipped, outOfDelivery, delivered }
