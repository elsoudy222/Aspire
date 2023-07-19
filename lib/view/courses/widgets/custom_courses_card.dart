import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors/app_colors.dart';

class CustomCoursesCard extends StatelessWidget {

  final String courseTitle;
  final String instructor;
  final String image;
  final VoidCallback onTap;

  const CustomCoursesCard({super.key, required this.courseTitle, required this.instructor, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Column(
        children: [

          Image(
            image: NetworkImage(image),
            width: double.infinity,
            height: 180.h,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(
                right: 6.0.w, left: 6.0.w, top: 10.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      courseTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.primaryColor),
                    ),
                    Text(
                      instructor,
                      style: TextStyle(
                          fontSize: 15.sp, color: AppColors.primaryColor),
                    ),
                  ],
                ),
                buttonWidget(context, title: "احجز الآن",onTap: onTap )
              ],
            ),
          )
        ],
      ),
    );
  }
}
Widget buttonWidget(
    context, {
      required String title,
      required VoidCallback onTap,

    }) {
  return GestureDetector(
    onTap: onTap,
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