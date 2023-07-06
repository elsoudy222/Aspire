import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>  Size.fromHeight(60.h);
  String title;
  VoidCallback? onPressed;
  bool showLeading;
  List<Widget> actions;
  Color colorAppBar;
  Color colorTxtAppBar;
  IconData? icon;

  CustomAppBar({
    this.showLeading = true,
    this.title = " ",
    this.onPressed,
    this.colorAppBar = AppColors.backgroundColor,
    this.colorTxtAppBar = AppColors.primaryColor,
    this.actions = const [],
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(icon,  color: AppColors.primaryColor,),
        onPressed: onPressed,
      ),
      elevation: 0,
      backgroundColor: colorAppBar,
      centerTitle: true,
      title: Image.asset(
        "assets/images/logo.png",fit: BoxFit.cover,height: 45.h,),
      actions: actions,
    );
  }
}
