import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors/app_colors.dart';
import '../constants/data/data.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CustomSendingFormDialog extends StatelessWidget {

  final String title;
  final bool stateValue;
  final Widget button;


  CustomSendingFormDialog({
    super.key,
    required this.title,
     required this.button,  this.stateValue= true,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        return Form(
          key: formKey,
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Exit Button (x) :
                    Container(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 25.h,
                          width: 27.w,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                cubit.fullNameController.clear();
                                cubit.phoneController.clear();
                                cubit.notesController.clear();
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 12.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10.h,
                    ),

                    // Title :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    // List of Text Form Field :
                    // 1. Full Name Field :
                    CustomTextFormFields(
                      topPadding: 22,
                      rightPadding: 20,
                      radius: 25,
                      focus: cubit.fullNameFocus,
                      enableInteractive: true,
                      hintText: 'اكتب اسمك بالكامل',
                      controller: cubit.fullNameController,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return "Full Name must be not Empty";
                        } else if (!RegExp(validationName).hasMatch(value.trim())) {
                          return "Full Name is not Valid";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // 2. Phone Number Field :
                    CustomTextFormFields(
                      topPadding: 22,
                      rightPadding: 20,
                      radius: 25,
                      focus: cubit.phoneFocus,
                      enableInteractive: true,
                      hintText: 'رقم الموبايل',
                      controller: cubit.phoneController,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return "Phone Number must be not Empty";
                        } else if (!RegExp(validationPhone).hasMatch(value.trim())) {
                          return "Phone Number is not Valid";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // 3. Any Notes Field :
                    CustomTextFormFields(
                      bottomPadding: 50,
                      topPadding: 22,
                      rightPadding: 20,
                      radius: 5,
                      focus: cubit.notesFocus,
                      enableInteractive: true,
                      hintText: 'لو عاوز تسيب ملاحظه للسنتر',
                      controller: cubit.notesController,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return "Notes must be not Empty";
                        } else if (!RegExp(validationName).hasMatch(value.trim())) {
                          return "Notes is not Valid";
                        }
                        return null;
                      },
                    ),

                    // Button :
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                      child: button,

                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
