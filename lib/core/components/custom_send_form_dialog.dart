
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors/app_colors.dart';
import '../constants/data/data.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CustomSendingFormDialog extends StatefulWidget {
  CustomSendingFormDialog({
    super.key,
  });

  @override
  State<CustomSendingFormDialog> createState() =>
      _CustomSendingFormDialogState();
}

class _CustomSendingFormDialogState extends State<CustomSendingFormDialog> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20.sp,
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
                    "انت دلوقتي بتحجز مادة العربي",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "الصف الاول مع استاذ محمود مجدي",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(
                height: 20.h,
              ),
              // List of Text Form Field :
              // 1. Full Name Field :
              CustomTextFormFields(
                enableInteractive: true,
                hintText: 'اكتب اسمك بالكامل',
                controller: fullNameController,
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  return null;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              // 2. Phone Number Field :
              CustomTextFormFields(
                enableInteractive: true,
                hintText: 'رقم الموبايل',
                controller: phoneController,
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  return null;
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              // 3. Any Notes Field :
              CustomTextFormFields(
                containerHeight: 110,
                enableInteractive: true,
                hintText: 'لو عاوز تسيب ملاحظه للسنتر',
                controller: notesController,
                keyboardType: TextInputType.text,
                validator: (String? value) {
                  return null;
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: CustomButton(
                    title: "ارسال",
                    onTap: () {
                      // First close Resent Dialog:
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
                                  color: Colors.white
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/images/congratiolations.png"),
                                    ),
                                    SizedBox(height: 15.h,),
                                    Text(
                                      "تم الارسال",
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    SizedBox(height: 15.h,),
                                    Text(
                                      "سيتم التواصل معك لتاكيد حجزك",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                                      child: CustomButton(
                                          title: "الرئيسية",
                                          onTap: () {
                                            Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              homeScreen,
                                              (route) => false,
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
