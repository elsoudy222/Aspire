
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/Navigate_system.dart';
import '../../../core/constants/app_colors/app_colors.dart';
import '../../levels/levels_screen.dart';

class CustomStageCard extends StatelessWidget {

   final String stageTitle;
 final VoidCallback onTap;
  final   List<String>  levelsTitle;
   final   List<String>   postData;
   CustomStageCard({super.key, required this.stageTitle, required this.onTap, required this.levelsTitle, required this.postData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigator(context, LevelsScreen(
          levelTitle: levelsTitle,
          stageTitle: stageTitle,
          levelsApiData: postData,
        ));

      },
      child: Container(
        height: 140.h,
        width: 160.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              25,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 6,
                blurRadius: 3,
                offset: Offset(1, 1),
              )
            ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              stageTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
