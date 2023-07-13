

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.image, required this.onTap});

  final String title;
  final String image;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.h,
        width: 160.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15,),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 6,
              blurRadius: 3,
              offset: Offset(1, 1),
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Expanded(
            //   child: Image(
            //     image: AssetImage(image),
            //     fit: BoxFit.contain,
            //     height: 80.h,
            //     width: 100.w,
            //   ),
            // ),
            Expanded(
              child: SvgPicture.asset(image),
            ),

            Text(title,
            style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}
