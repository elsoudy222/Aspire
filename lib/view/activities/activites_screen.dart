import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_appbar.dart';
import '../../core/components/custom_scaffold.dart';
import '../../core/components/custom_send_form_dialog.dart';
import '../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';
import '../../view-model/cubits/activities_cubit/activity_cubit.dart';
import '../../view-model/database/network/end_points.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActivityCubit, ActivityStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var activityCubit = ActivityCubit.get(context);
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
                          "انشطة اخرى",
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
                          "يمكنك حجز كل الانشطه المتاحة من خلالنا",
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
                    condition: state is! LoadingActivitiesState,
                    builder: (context){
                      return  Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: activityCubit.activityModel.length,
                            itemBuilder: (context, index) {
                              return customActivityCard(
                                context,
                                activityTitle: activityCubit.activityModel[index].actvName!,
                                image: "${baseImage}${activityCubit.activityModel[index].actvPhoto!}" ,
                              );
                            }),
                      );
                    },
                    fallback: (context)=> SizedBox(
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
            ));
      },
    );
  }
}

Widget buttonWidget(
  context, {
  required String title,
}) {
  return GestureDetector(
    onTap: () {
      print("tapped");
      showDialog(
          context: context,
          builder: (context) {
            return CustomSendingFormDialog(
              title: ' تأجير قاعات',

            );
          });
    },
    child: Container(
      height: 40.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(30).w,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget customActivityCard(
  context, {
  required String activityTitle,
  required String image,
  VoidCallback? onTap,
}) {
  return Container(
    //height: 230.h,
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 5.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        15,
      ),
    ),
    child: Column(
      children: [
        Image(
          image: AssetImage(image),
          width: double.infinity,
          height: 180.h,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(
              right: 6.0.w, left: 6.0.w, top: 10.h, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    activityTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
              buttonWidget(context, title: "احجز الآن")
            ],
          ),
        )
      ],
    ),
  );
}
