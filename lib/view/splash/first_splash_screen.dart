import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:aspire_edu/view/splash/second_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_scaffold.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});

  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 170.h,
            child: AnimatedSplashScreen(

              duration: 3000,
              splash: 'assets/images/logo.png',
              splashIconSize: 140.h,
              nextScreen: const SecondSplashScreen(),
              splashTransition: SplashTransition.fadeTransition,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 15.h,
                  width: 15.w,
                  child: CircularProgressIndicator(color: Colors.grey[600],strokeWidth: 1,)),
              SizedBox(width: 15.w,),
              Text(
                "تحميل",
                style: TextStyle(
                  fontSize: 15.sp,
                  //fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
