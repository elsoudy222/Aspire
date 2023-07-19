import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:aspire_edu/view-model/cubits/courses_cubit/courses_cubit.dart';
import 'package:aspire_edu/view/courses/widgets/custom_courses_card.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_appbar.dart';
import '../../core/components/custom_button.dart';
import '../../core/components/custom_scaffold.dart';
import '../../core/components/custom_send_form_dialog.dart';
import '../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';
import '../../view-model/database/network/end_points.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var courseCubit = CoursesCubit.get(context);
    return BlocConsumer<CoursesCubit, CoursesStates>(
  listener: (context, state) {
    if(state is SuccessSendCourseFormDataState){
      Navigator.pop(context);
      // Then Show the New Dialog
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image:
                      AssetImage("assets/images/congratiolations.png"),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "تم الارسال",
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "سيتم التواصل معك لتاكيد حجزك",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      child: CustomButton(
                          title: "الرئيسية",
                          color: AppColors.secondaryColor,
                          onTap: () {
                            AppCubit.get(context).fullNameController.clear();
                            AppCubit.get(context).phoneController.clear();
                            AppCubit.get(context).notesController.clear();
                            /// to not save the model when try to get new lesson:
                            // famousCubit.famousModel.clear();
                            Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false,);



                          }),
                    )
                  ],
                ),
              ),
            );
          });
    }
  },
  builder: (context, state) {
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
                      "الكورسات",
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
                      "توفر المنصة أفضل الكورسات في مختلف المجالات.",
                      style: TextStyle(
                        color: Color(0xFF163D66),
                        fontWeight: FontWeight.w600,
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
                condition: state is! LoadingCoursesState,
                builder: (context) {
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: courseCubit.courseModel.length,
                        itemBuilder: (context, index) {
                          return CustomCoursesCard(
                            courseTitle:
                            courseCubit.courseModel[index].courseName!,
                            instructor:
                            courseCubit.courseModel[index].trainerName!,
                            image: "${baseImage}${courseCubit.courseModel[index].coursePhoto}",
                            onTap: () {
                              print("tapped");
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    var courseName = courseCubit.courseModel[index].courseName!;
                                    var instructorName= courseCubit.courseModel[index].trainerName!;
                                    return CustomSendingFormDialog(
                                      title: 'انت دلوقتي بتحجز كورس ${courseName} مع ${instructorName}',
                                      button: ConditionalBuilder(
                                        condition: state
                                        is! LoadingSendCourseFormDataState,
                                        builder: (context) => CustomButton(
                                          title: "ارسال",
                                          color: AppColors.secondaryColor,
                                          onTap: () {
                                            ///============== Post Request:==================
                                            courseCubit.sendCoursesFormData(
                                              courseName: courseCubit.courseModel[index].courseName!,
                                              studentName: AppCubit.get(context).fullNameController.text,
                                              studentNumber: AppCubit.get(context).phoneController.text,
                                              notes: AppCubit.get(context).notesController.text,
                                            );

                                            print(courseCubit.courseModel[index].courseName!);
                                            print(AppCubit.get(context).fullNameController.text);
                                            print(AppCubit.get(context).phoneController.text);
                                            print(AppCubit.get(context).notesController.text);

                                            /// ===========================================================
                                          },
                                        ),
                                        fallback: (context) => const Center(
                                          child:
                                          CircularProgressIndicator(),
                                        ),
                                      ),
                                    );
                                  });
                            },
                          );
                        }),
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
    );
  },
);
  }
}

