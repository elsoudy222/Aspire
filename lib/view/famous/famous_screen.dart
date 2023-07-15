import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/custom_appbar.dart';
import '../../core/components/custom_scaffold.dart';
import '../../core/components/custom_send_form_dialog.dart';
import '../../core/constants/app_colors/app_colors.dart';
import '../../core/constants/data/data.dart';

class FamousScreen extends StatelessWidget {
  const FamousScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarCustom: CustomAppBar(
          icon: Icons.arrow_back_outlined,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: BlocProvider(
          create: (context) => AppCubit()..getFamous(),
          child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = AppCubit.get(context);
              print(cubit.famousModel);
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "مشاهير",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0D001D),
                              fontSize: 25.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: cubit.famousModel.length,
                          itemBuilder: (context, index) {
                            print(cubit.famousModel[index].celeName);
                            return customFamousCard(
                                context,
                                instructor: cubit.famousModel[index].celeName!,
                                subtitle: cubit.famousModel[index].aboutcele!,
                                image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv4UK-VacVrppny4aGjzhWStSrcsP_6A1UdFvRLCMg&s",
                            );
                          }),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
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
              title: 'ندوة',
              instructor: 'الاستاذ  ياسر الحزيمي',
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

Widget customFamousCard(
  context, {
  required String instructor,
  required String subtitle,
  required String image,
  VoidCallback? onTap,
}) {
  return Container(
    //height: 230.h,
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 5.h),
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(
        15,
      ),
    ),
    child: Column(
      children: [
        Image(
          image: NetworkImage(image),
          width: double.infinity,
           height: 185.h,
          fit: BoxFit.cover,
        ),

        // SvgPicture.asset("assets/svg/yasser.svg"),
        Padding(
          padding: EdgeInsets.only(right: 6.0.w, left: 6.0.w, top: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    instructor,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
              buttonWidget(context, title: "احجز الآن"),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
