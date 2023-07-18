import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:aspire_edu/view/teachers/widgets/custom_teacher_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/custom_appbar.dart';
import '../../../core/components/custom_scaffold.dart';
import '../../../core/constants/app_colors/app_colors.dart';
import '../../core/components/custom_button.dart';
import '../../core/components/custom_send_form_dialog.dart';

class TeachersScreen extends StatelessWidget {
  TeachersScreen({
    super.key,
    required this.subject,
  });

  final List<dynamic> subject;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var teacherCubit = AppCubit.get(context);
        return CustomScaffold(
          appBarCustom: CustomAppBar(
            icon: Icons.arrow_back_outlined,
            onPressed: () {
              teacherCubit.teachersModel.clear();
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
                          color: state is SuccessSelectTeacherState  ?
                          teacherCubit.currentTeacherIndex == i ?
                        AppColors.secondaryColor : Colors.white : Colors.white,
                          onTap: (){
                            teacherCubit.changeTeacherIndex(i);
                            teacherCubit.teacherSelected(teacherCubit.teachersModel[teacherCubit.currentTeacherIndex].teacherName!);

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

                  // Spacer(),
                  CustomButton(
                    title: "احجز الآن",
                    onTap: () {
                      print("tapped");
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomSendingFormDialog(
                              title:
                                  " انت دلوقتي بتحجز مادة ${subject[teacherCubit.currentSubjectIndex]} ${teacherCubit.stage[teacherCubit.currentLevelIndex].levelTitleData[teacherCubit.currentLevelIndex]} مع ${teacherCubit.teachersModel[teacherCubit.currentTeacherIndex].teacherName!}    ",
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
