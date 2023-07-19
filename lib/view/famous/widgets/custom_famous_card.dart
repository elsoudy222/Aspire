import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/custom_send_form_dialog.dart';
import '../../../core/constants/app_colors/app_colors.dart';

class CustomFamousCard extends StatelessWidget {

  final String instructor;
  final String subtitle;
  final String image;
  final VoidCallback onTap;
   CustomFamousCard({super.key, required this.instructor, required this.subtitle, required this.image,required this.onTap,});
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 230.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Column(
        children: [
          Image(
            image: NetworkImage(image),
            width: double.infinity,
            height: 185.h,
            fit: BoxFit.cover,
          ),

          // SvgPicture.asset("assets/svg/yasser.svg"),
          Padding(
            padding: EdgeInsets.only(right: 6.0.w, left: 6.0.w, top: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      instructor,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
                buttonWidget(context, title: "احجز الآن",
                  onTap: onTap,  ),
                SizedBox(
                  height: 10.h,
                ),
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
