import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:aspire_edu/view-model/database/local/cache_helper.dart';
import 'package:aspire_edu/view/lessons/lessons_screen.dart';
import 'package:aspire_edu/view/levels/widgets/custom_levels_card.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_appbar.dart';
import '../../core/components/custom_scaffold.dart';
import '../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';

class LevelsScreen extends StatelessWidget {
  final List<String> levelTitle;
  final List<String> levelsApiData;
  final String stageTitle;
  final String lang;

  LevelsScreen({
    super.key,
    required this.levelTitle,
    required this.stageTitle,
    required this.levelsApiData, required this.lang,

  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SuccessGetMaterialsState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LessonsScreen(
              subject: state.materials,
              lessonsApiData: levelsApiData,
            );
          }));
        }
      },
      builder: (context, state) {
        var appCubit = AppCubit.get(context);

        return CustomScaffold(
          appBarCustom: CustomAppBar(
            icon: Icons.arrow_back_outlined,
            onPressed: () {
              Navigator.pop(context);
              print(appCubit.section);

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
                          stageTitle,
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
                          "كل ما ستحتاجه من دروس فى \n${stageTitle} لجميع الصفوف",
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
                    builder: (context) {
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: levelTitle.length,
                        itemBuilder: (context, i) {
                          return CustomLevelsCard(
                            title: levelTitle[i],
                            onTap: () {
                              appCubit.changeLevelIndex(i);

                              appCubit.getAllMaterials(
                                lang: appCubit.section!,
                                eduClass: levelsApiData[appCubit.currentLevelIndex],
                              );
                            },
                          );
                        },
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 90.h,
                                crossAxisSpacing: 35.w,
                                mainAxisSpacing: 40.h),
                      );
                    },
                    fallback: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height/2,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget customLevelsCard(
    context, {
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
}
