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
      listener: (context, state) {

      },
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return CustomScaffold(
            appBarCustom: CustomAppBar(
              icon: Icons.arrow_back_outlined,
              onPressed: () {
                Navigator.pop(context);


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
                      color:  state is SuccessSelectLanguageState || state is SuccessSelectArabicState? appCubit.sectionTextColor : Colors.red,

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
                        color: state is SuccessSelectArabicState
                            ? AppColors.primaryColor
                            : Colors.grey,
                        onTap: () {
                          appCubit.arabicSelected();
                        },
                      ),
                      buttonWidget(
                        title: "لغات",
                        color: state is SuccessSelectLanguageState
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
                          levelsTitle: appCubit.stage[i].levelTitle,
                          postData: appCubit.stage[i].levelTitleData,
                          onTap: () {
                            // to store the index:
                            appCubit.changeLevelIndex(i);

                            navigator(context, LevelsScreen(
                              levelTitle: appCubit.stage[i].levelTitle,
                              stageTitle: appCubit.stage[i].stage,
                              levelsApiData: appCubit.stage[i].levelTitleData,
                            ));

                          },
                        );
                      },
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     customStagesCard(
                  //       context,
                  //       title: appCubit.stage[0].stage,
                  //       levelsTitle: appCubit.stage[0].levelTitle,
                  //       postData: appCubit.stage[0].levelTitleData,
                  //     ),
                  //     SizedBox(
                  //       width: 10.w,
                  //     ),
                  //     customStagesCard(
                  //       context,
                  //       title: appCubit.stage[1].stage,
                  //       levelsTitle: appCubit.stage[1].levelTitle,
                  //       postData: appCubit.stage[1].levelTitleData,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 35.h,
                  // ),
                  // customStagesCard(
                  //   context,
                  //   title: appCubit.stage[2].stage,
                  //   levelsTitle: appCubit.stage[2].levelTitle,
                  //   postData: appCubit.stage[2].levelTitleData,
                  // ),
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
        borderRadius: BorderRadius
            .circular(30)
            .w,
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
