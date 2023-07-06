
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_appbar.dart';
import '../../core/components/custom_scaffold.dart';
import '../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';

class StagesScreen extends StatelessWidget {
  const StagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarCustom: CustomAppBar(
        icon: Icons.arrow_back_outlined,
          onPressed: (){
          Navigator.pop(context);
          },
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0.w,vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "المراحل الدراسية",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0D001D),
                        fontSize: 25.sp,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(
                      "معاً نحو التقدم",
                      style: TextStyle(
                        color: Color(0xFF163D66),
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      "كل ما ستحتاجه من دروس فى جميع المراحل ",
                      style: TextStyle(
                        color: Color(0xFF163D66),
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h,),
              Text(
                "اختار شعبتك الاول",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,

                ),
              ),
              SizedBox(height: 25.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonWidget(
                    title: "عربي"
                  ),
                  buttonWidget(
                    title: "لغات"
                  ),
                ],
              ),
              SizedBox(height: 30.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customStagesCard(context,title: "المرحلة\nالابتدائية",),
                  SizedBox(width: 10.w,),
                  customStagesCard(context,title: "المرحلة\nالاعدادية",),
                ],
              ),
              SizedBox(height: 35.h,),
              customStagesCard(context,title: "المرحلة\nالثانوية",)
            ],
          ),
        ));
  }
}

Widget buttonWidget({
  required String title
}){
  return Container(
    height: 40.h,
    width: 120.w,
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(30).w,
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp
        ),
      ),
    ),
  );
}

Widget customStagesCard(context,{
  required String title,
   VoidCallback? onTap,
}){
  return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, levelsScreen);
    },
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
      child: Center(
        child: Text(title,
          style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold,color: AppColors.primaryColor),),
      ),
    ),
  );
}