

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/custom_appbar.dart';
import '../../../core/components/custom_scaffold.dart';
import '../../../core/constants/app_colors/app_colors.dart';
import '../../core/components/custom_button.dart';
import '../../core/components/custom_send_form_dialog.dart';

class TeachersScreen extends StatelessWidget {
  TeachersScreen({super.key});

  List<String> titles = [
    "محمود مجدي",
    "محمد الباز",
    "محمود مجدي",
    "محمد الباز",
    "محمود مجدي",
    "محمد الباز",
    "محمود مجدي",
    "محمد الباز",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarCustom: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "المدرسين",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0D001D),
                        fontSize: 25.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "اختر المدرس المُفضل فى مادة العربي",
                      style: TextStyle(
                        color: const Color(0xFF163D66),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: titles.length,
                itemBuilder: (context, i) {
                  return customTeachersCard(title: titles[i]);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 90.h,
                    crossAxisSpacing: 23.w,
                    mainAxisSpacing: 20.h),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                title: "احجز الآن",
                onTap: () {
                  print("tapped");
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomSendingFormDialog();
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


}

Widget customTeachersCard({
  required String title,
}) {
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 6,
            blurRadius: 3,
            offset: const Offset(1, 1),
          )
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "الأستاذ",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    ),
  );
}
