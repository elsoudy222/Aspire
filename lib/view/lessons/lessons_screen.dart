import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/custom_appbar.dart';
import '../../../core/components/custom_scaffold.dart';
import '../../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';

class LessonsScreen extends StatelessWidget {
  LessonsScreen({super.key, required this.lessons});

  final List<String> lessons;
  // List<String> titles = [
  //   "عربي",
  //   "انجليزي",
  //   "عربي",
  //   "انجليزي",
  //   "عربي",
  //   "انجليزي",
  //   "عربي",
  //   "انجليزي",
  //   "عربي",
  //   "انجليزي",
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
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
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "الصف الاول",
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
                            "جميع مواد الصف الاول",
                            style: TextStyle(
                              color: Color(0xFF163D66),
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
                      itemCount: lessons.length,
                      itemBuilder: (context, i) {
                        return customLessonsCard(
                            context,
                            title: lessons[i]);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 90.h,
                          crossAxisSpacing: 23.w,
                          mainAxisSpacing: 20.h),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget customLessonsCard(context, {
  required String title,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, teachersScreen);
    },
    child: Container(
      margin: EdgeInsets.all(10),
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
              offset: Offset(1, 1),
            )
          ]),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    ),
  );
}