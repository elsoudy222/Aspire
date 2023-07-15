import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
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
  final List<String> levels;

  LevelsScreen({
    super.key,
    required this.levels,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
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
                            "المرحلة الابتدائية",
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
                            "كل ما ستحتاجه من دروس\nفى المرحلة الابتدائية لجميع الصفوف ",
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
                      itemCount: levels.length,
                      itemBuilder: (context, i) {
                        return ConditionalBuilder(
                          condition: state is! LoadingGetMaterialsState,
                          builder: (context) =>
                              CustomLevelsCard(
                                title: levels[i],
                                onTap: () {
                                  if(state is! LoadingGetMaterialsState){
                                  cubit.getAllMaterials(
                                    lang: "arabic",
                                    eduClass: "الصف الثانى الاعدادي",
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context){
                                    return LevelsScreen(levels: cubit.materialModel);
                                  }));
                                  }
                                },
                              ),
                          fallback: (context) =>
                              Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 90.h,
                          crossAxisSpacing: 35.w,
                          mainAxisSpacing: 40.h),
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

  Widget customLevelsCard(context, {
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
