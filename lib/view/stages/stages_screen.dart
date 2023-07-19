import 'package:aspire_edu/core/components/Navigate_system.dart';
import 'package:aspire_edu/model/stage_levels_model.dart';
import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:aspire_edu/view-model/database/local/cache_helper.dart';
import 'package:aspire_edu/view/home/home_screen.dart';
import 'package:aspire_edu/view/levels/levels_screen.dart';
import 'package:aspire_edu/view/stages/widgets/custom_stage_card.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_appbar.dart';
import '../../core/components/custom_scaffold.dart';
import '../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';

class StagesScreen extends StatelessWidget {
  StagesScreen({super.key});

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return CustomScaffold(
            appBarCustom: CustomAppBar(
              icon: Icons.arrow_back_outlined,
              onPressed: () {
                appCubit.section = null;
                Navigator.pop(context);
                print(appCubit.section);
              },
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
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
                        SizedBox(
                          height: 10.h,
                        ),
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
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "اختار شعبتك الاول",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: appCubit.section == null
                          ? Colors.red
                          : appCubit.sectionTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buttonWidget(
                        title: "عربي",
                        color: appCubit.section == "arabic"
                            ?  AppColors.primaryColor
                            : Colors.grey,
                        onTap: () {
                          appCubit.arabicSelected();
                        },
                      ),
                      buttonWidget(
                        title: "لغات",
                        color: appCubit.section == "language"
                            ? AppColors.primaryColor
                            : Colors.grey,
                        onTap: () {
                          appCubit.langSelected();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  //ConditionalBuilder(condition: condition, builder: builder, fallback: fallback,),
                  Expanded(
                    child: GridView.builder(
                      itemCount: appCubit.stage.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 35.w,
                          mainAxisSpacing: 20.h),
                      itemBuilder: (context, i) {
                        return CustomStageCard(
                          stageTitle: appCubit.stage[i].stage,
                          onTap: () {
                            // to store the index:
                            appCubit.changeLevelIndex(i);

                            appCubit.section == null
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(
                                      content: Center(
                                        child: Text(
                                          "برجاء اختيار الشعبة",
                                          style: TextStyle(
                                            fontSize: 22.sp
                                          ),
                                        ),
                                      ),

                                      backgroundColor: Colors.red,
                                      dismissDirection: DismissDirection.down,
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  )
                                : navigator(
                                    context,
                                    LevelsScreen(
                                      levelTitle: appCubit.stage[i].levelTitle,
                                      stageTitle: appCubit.stage[i].stage,
                                      levelsApiData:
                                          appCubit.stage[i].levelTitleData,
                                      lang: appCubit.section!,
                                    ));
                          },
                        );
                      },
                    ),
                  ),

                ],
              ),
            ));
      },
    );
  }
}

Widget buttonWidget({
  required String title,
  required VoidCallback onTap,
  required color,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30).w,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      ),
    ),
  );
}
