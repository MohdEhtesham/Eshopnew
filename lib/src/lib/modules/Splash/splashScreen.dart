import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gunlox/components/Constants/AppColors.dart';
import 'package:gunlox/components/Constants/AppFontFamily.dart';
import 'package:gunlox/components/Constants/AppImages.dart';
import 'package:gunlox/components/strings/Constants.dart';
import 'package:gunlox/modules/WelcomePage/WelcomeScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showFinalLock = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 1.0, end: .3).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      print("--------- $status");
      if (status == AnimationStatus.completed) {
        setState(() {
          showFinalLock = true;
        });
        Future.delayed(Duration(seconds: 1), () {
          Get.off(() => const WelcomeScreen());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashbg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center Logo with Animated Text
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [

 Center(
                          // top: 25.h,
                          child: Image.asset(
                            AppImages.blacklock,
                            fit: BoxFit.cover,
                          ),
                        ),
                  Positioned(
                    top: 55.h,
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animation.value,
                          child: Image.asset(
                            AppImages.gunloximage,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
