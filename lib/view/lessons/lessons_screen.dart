import 'package:aspire_edu/core/components/Navigate_system.dart';
import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:aspire_edu/view/lessons/widgets/custom_lessons_card.dart';
import 'package:aspire_edu/view/teachers/teachers_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/custom_appbar.dart';
import '../../../core/components/custom_scaffold.dart';
import '../../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';

class LessonsScreen extends StatelessWidget {
  LessonsScreen({super.key, required this.subject, required this.lessonsApiData, });

  final List<dynamic> subject;
  final List<String> lessonsApiData;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SuccessGetTeachersState) {
          navigator(context, TeachersScreen(
            subject: subject,)
          );
        }
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
                        // TODO : View title of level :

                        Text(
                          cubit.stage[cubit.currentLevelIndex].levelTitle[cubit.currentLevelIndex],
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
                          "جميع مواد ${cubit.stage[cubit.currentLevelIndex].levelTitle[cubit.currentLevelIndex]}",
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
                  ConditionalBuilder(
                    condition: state is! LoadingGetMaterialsState,
                    builder: (context){
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: subject.length,
                      itemBuilder: (context, i) {
                        return CustomLessonsCard(
                          title: subject[i],
                          onTap: () {
                            cubit.changeSubjectIndex(i);
                            cubit.getAllTeachers(
                              lang: cubit.section,
                              eduClass: lessonsApiData[cubit.currentLevelIndex],
                              materialName: subject[i],
                            );
                          },
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 90.h,
                          crossAxisSpacing: 23.w,
                          mainAxisSpacing: 20.h),
                    );
                    },
                    fallback: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height/2,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 5,
                        ),
                      ),
                    ),),

                ],
              ),
            ),
          ),
        );
      },
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