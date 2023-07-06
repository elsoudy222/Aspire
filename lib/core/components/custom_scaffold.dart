import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors/app_colors.dart';
import 'custom_appbar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  final String? appBarTitle;
  final IconData? icon;
  final Function? onPressed;
  final Widget? bottomNavigationBar;
  final CustomAppBar? appBarCustom;
  final bool? condition;

  final bool? isExtend;
  final Color backgroundColor ;

  final Widget? floatingActionButton;
  // final Color? color;

  const CustomScaffold({
    Key? key,
    required this.body,
    this.appBarTitle,
    this.icon,
    this.onPressed,
    this.bottomNavigationBar,
   // this.appBarCustom,
    this.condition = true,
    this.isExtend = false,
    // this.color = primaryColor,
    this.floatingActionButton,
    this.backgroundColor = AppColors.backgroundColor, this.appBarCustom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      extendBodyBehindAppBar: isExtend!,
      resizeToAvoidBottomInset: true,
      appBar: appBarCustom,
      backgroundColor: backgroundColor,
      body: body
    );
  }
}


//
// Padding(
// padding: EdgeInsets.only(left: 10.w, right: 10.w, ),
// child: body,
// ),