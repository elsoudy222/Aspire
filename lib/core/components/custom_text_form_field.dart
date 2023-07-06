import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors/app_colors.dart';

// ignore: must_be_immutable
class CustomTextFormFields extends StatefulWidget {
  final String hintText;
  final String? Function(String?) validator;
  final Function(String?)? onSaved;
  final TextInputType keyboardType;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final FocusNode? focus;
  final Function(String?)? onChanged;
  final int verticalPadding;
  final int horizontalPadding;
  final int containerHeight;

  final int? minLines;
  final int? maxLines;

  CustomTextFormFields({
    Key? key,
    required this.hintText,
    required this.validator,
    this.onSaved,
    required this.keyboardType,
    this.onEditingComplete,
    this.textInputAction,
    required this.controller,
    this.focus,
    this.onChanged,
    required bool enableInteractive,
     this.verticalPadding = 6,
     this.horizontalPadding = 13,
     this.containerHeight = 50, this.minLines, this.maxLines,
  }) : super(key: key);

  @override
  State<CustomTextFormFields> createState() => _CustomTextFormFieldsState();
}

class _CustomTextFormFieldsState extends State<CustomTextFormFields> {
  //const CustomTextFormFields({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
     height: widget.containerHeight.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey)
      ),
      child: TextFormField(
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: widget.focus,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        onEditingComplete: widget.onEditingComplete,
        onChanged: (value) {
          //onChanged!(value);
          widget.onChanged != null ? widget.onChanged!(value) : null;
        },
        style: const TextStyle(
            color: Colors.black
        ),
        cursorColor: AppColors.primaryColor,

        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          isDense: true,

          hintText: widget.hintText,
          hintStyle:  TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
          ),

          border: InputBorder.none,
          contentPadding:  EdgeInsets.symmetric(
            vertical: widget.verticalPadding.h,
            horizontal: widget.horizontalPadding.w,
          ),

        ),


        validator: widget.validator,
        onSaved: (value) {
          // widget.onSaved != null ? widget.onSaved!(value) : null;
        },
        keyboardType: widget.keyboardType,
      ),
    );
  }
}