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
  final int topPadding;
  final int bottomPadding;
  final int rightPadding;
  final int leftPadding;
  final double radius;

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

    this.minLines,
    this.maxLines,
     this.topPadding = 6,
     this.bottomPadding = 6,
     this.rightPadding = 13,
     this.leftPadding = 13,
    this.radius = 18,
  }) : super(key: key);

  @override
  State<CustomTextFormFields> createState() => _CustomTextFormFieldsState();
}

class _CustomTextFormFieldsState extends State<CustomTextFormFields> {
  //const CustomTextFormFields({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      style: const TextStyle(color: Colors.black),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        hintText: widget.hintText,

        hintStyle: TextStyle(
          fontSize: 16.sp,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.only(
          top: widget.topPadding.h,
          bottom: widget.bottomPadding.w,
          right: widget.rightPadding.w,
          left: widget.leftPadding.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(widget.radius)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(widget.radius)),
      ),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
    );
  }
}
