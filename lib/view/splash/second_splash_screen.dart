import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_scaffold.dart';
import '../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';
import '../home/home_screen.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
    const Duration(seconds: 4),
      () {
      /// ************* Navigator *************
        Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false);
      },);
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:  Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image(
              image: AssetImage(
                  "assets/images/logo.png",
              ),
              height: 100.h,

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 18,
            ),
            Column(
              children: [
                Text(
                  "مرحبا بك فى",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  "أكـاديـــمــــيــــة اسباير",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/30,
                ),
                Text(
                  "مساحتك المبتكرة للتعلم الالكتروني",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.sp,
                    color: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 55,
                ),
                Text(
                  "نقدم لكم مجموعة من المحاضرين",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  " والدروس لدعمكم الدائم",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
