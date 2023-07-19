import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:aspire_edu/view/teachers/widgets/custom_teacher_card.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/custom_appbar.dart';
import '../../../core/components/custom_scaffold.dart';
import '../../../core/constants/app_colors/app_colors.dart';
import '../../core/components/custom_button.dart';
import '../../core/components/custom_send_form_dialog.dart';
import '../../core/constants/data/data.dart';

class TeachersScreen extends StatelessWidget {
  TeachersScreen({
    super.key,
    required this.subject,
  });

  final List<dynamic> subject;

  @override
  Widget build(BuildContext context) {
    var teacherCubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
       if (state is SuccessSendMaterialFormDataState){
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
                                teacherCubit.section = null;
                                teacherCubit.fullNameController.clear();
                                teacherCubit.phoneController.clear();
                                teacherCubit.notesController.clear();
                                /// to not save the model when try to get new lesson:
                                teacherCubit.teachersModel.clear();
                                teacherCubit.currentTeacherIndex == null;
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
              teacherCubit.teachersModel.clear();
              teacherCubit.currentTeacherIndex = null;
              Navigator.pop(context);
            },
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
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
                          "اختر المدرس المُفضل فى مادة ${subject[teacherCubit.currentSubjectIndex]}",
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
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: teacherCubit.teachersModel.length,
                      itemBuilder: (context, i) {
                        return CustomTeacherCard(
                          title: teacherCubit.teachersModel[i].teacherName!,
                          // check the state and index:
                          color: state is SuccessSelectTeacherState
                              ? teacherCubit.currentTeacherIndex == i
                                  ? AppColors.secondaryColor
                                  : Colors.white
                              : Colors.white,
                          onTap: () {
                            teacherCubit.changeTeacherIndex(i);
                            teacherCubit.teacherSelected(teacherCubit
                                .teachersModel[
                                    teacherCubit.currentTeacherIndex!]
                                .teacherName!);
                          },
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 90.h,
                          crossAxisSpacing: 23.w,
                          mainAxisSpacing: 20.h),
                    ),
                  ),


                  CustomButton(
                    title: "احجز الآن",
                    color: teacherCubit.currentTeacherIndex == null
                        ? Colors.grey
                        : AppColors.secondaryColor,
                    onTap: () {
                      print("tapped");
                      teacherCubit.currentTeacherIndex == null
                          ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(
                            child: Text(
                              "برجاء اختيار المدرس الذى تريده",
                              style: TextStyle(
                                  fontSize: 22.sp
                              ),
                            ),
                          ),

                          backgroundColor: Colors.red,
                          dismissDirection: DismissDirection.down,
                          duration: Duration(milliseconds: 500),
                        ),
                      ): showDialog(
                              context: context,
                              builder: (context) {
                                return CustomSendingFormDialog(

                                  title: " انت دلوقتي بتحجز مادة ${subject[teacherCubit.currentSubjectIndex]} ${teacherCubit.stage[teacherCubit.currentLevelIndex].levelTitleData[teacherCubit.currentLevelIndex]} مع ${teacherCubit.teachersModel[teacherCubit.currentTeacherIndex!].teacherName!}    ",
                                  button: ConditionalBuilder(
                                  condition: state is! LoadingSendMaterialFormDataState,
                                  builder: (context) => CustomButton(
                                    title: "ارسال",
                                    color: AppColors.secondaryColor,
                                    onTap: () {
                                      ///============== Post Request:==================
                                      teacherCubit.sendMaterialFormData(
                                        lang: teacherCubit.section!,
                                        eduClass: teacherCubit.stage[teacherCubit.currentLevelIndex].levelTitleData[teacherCubit.currentLevelIndex],
                                        materialName: subject[teacherCubit.currentSubjectIndex], teacherName: teacherCubit.teachersModel[teacherCubit.currentTeacherIndex!].teacherName!,
                                        studentName: teacherCubit.fullNameController.text,
                                        studentNumber: teacherCubit.phoneController.text,
                                        notes: teacherCubit.notesController.text,
                                      );
                                      /// ===========================================================

                                      teacherCubit.currentTeacherIndex = null;
                                      print("Teacher Index${teacherCubit.currentTeacherIndex}");

                                      print(teacherCubit.section);
                                      print(teacherCubit.fullNameController.text);
                                      print(teacherCubit.phoneController.text);
                                    },
                                  ),
                                  fallback: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),

                                );
                              });
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
