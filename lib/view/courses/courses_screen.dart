import 'package:aspire_edu/core/components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_appbar.dart';
import '../../core/components/custom_scaffold.dart';
import '../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarCustom: CustomAppBar(
          icon: Icons.arrow_back_outlined,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الكورسات",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D001D),
                          fontSize: 25.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "توفر المنصة أفضل الكورسات في مختلف المجالات.",
                        style: TextStyle(
                          color: Color(0xFF163D66),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                        ),
                      ),
                      // Text(
                      //   "كل ما ستحتاجه من دروس فى جميع المراحل ",
                      //   style: TextStyle(
                      //     color: Color(0xFF163D66),
                      //     fontSize: 18.sp,
                      //   ),
                      // ),
                      //
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return customCoursesCard(context);
                    }),
                customCoursesCard(
                  context,
                )
              ],
            ),
          ),
        ));
  }
}

Widget buttonWidget({required String title}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(30).w,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget customCoursesCard(
  context, {
  // required String courseTitle,
  // required String instructor,
  // required String image,
  VoidCallback? onTap,
}) {
  return Container(
    height: 230.h,
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 5.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        15,
      ),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.1),
      //     spreadRadius: 6,
      //     blurRadius: 3,
      //     offset: Offset(1, 1),
      //   )
      // ],
    ),
    child: Column(
      children: [
        Image(
          image: AssetImage("assets/images/german.png"),
          width: double.infinity,
          height: 180.h,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(right: 6.0.w, left: 6.0.w, top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "كورس الألماني",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.primaryColor),
                  ),
                  Text(
                    "هير / محمد عويس",
                    style: TextStyle(
                        fontSize: 15.sp, color: AppColors.primaryColor),
                  ),
                ],
              ),
              buttonWidget(title: "احجز الآن")
            ],
          ),
        )
      ],
    ),
  );
}
