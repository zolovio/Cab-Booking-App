// ignore_for_file: use_build_context_synchronously

import 'package:cab_booking/src/core/services/app_router.dart';
import 'package:cab_booking/src/core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool changeBg = false;
  int showProgress = 10;

  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  nextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      changeBg = true;
      showProgress = 20;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      changeBg = false;
      showProgress = 30;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      changeBg = true;
      showProgress = 40;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      changeBg = false;
      showProgress = 48;
    });
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).popAndPushNamed(AppRouter.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: (changeBg)
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [AppColors.deepOrange, AppColors.liteOrange],
                  )
                : RadialGradient(
                    radius: 3.0,
                    center: Alignment.centerLeft,
                    colors: [
                      AppColors.deepBlue2.withOpacity(0.3),
                      AppColors.deepOrange.withOpacity(0.7),
                    ],
                  )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30.sm),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 150.h,
                  width: 150.w,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.5),
                      blurRadius: 2,
                    )
                  ]),
                  child: StepProgressIndicator(
                    size: 8,
                    padding: 0,
                    totalSteps: 50,
                    currentStep: showProgress,
                    roundedEdges: const Radius.circular(20),
                    unselectedColor: AppColors.white,
                    selectedGradientColor: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.deepOrange,
                        AppColors.liteOrange,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
