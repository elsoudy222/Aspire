
import 'package:aspire_edu/view/courses/courses_screen.dart';
import 'package:aspire_edu/view/home/home_screen.dart';
import 'package:aspire_edu/view/lessons/lessons_screen.dart';
import 'package:aspire_edu/view/levels/levels_screen.dart';
import 'package:aspire_edu/view/splash/first_splash_screen.dart';
import 'package:aspire_edu/view/splash/second_splash_screen.dart';
import 'package:aspire_edu/view/stages/stages_screen.dart';
import 'package:aspire_edu/view/teachers/teachers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(400,800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Aspire Education',
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', 'AR'),
            ],
            theme: ThemeData(
                textTheme: GoogleFonts.tajawalTextTheme()
            ),
            initialRoute: '/',
            routes: {
              '/' : (context) => FirstSplashScreen(),
              secondSplashScreen : (context) => SecondSplashScreen(),
              homeScreen : (context) => HomeScreen(),
              stagesScreen : (context) =>  StagesScreen(),
              //levelsScreen : (context) => LevelsScreen(levelTitle: titles,),
              lessonsScreen : (context) => LessonsScreen(),
              teachersScreen : (context) => TeachersScreen(),
              coursesScreen : (context) => CoursesScreen(),
            },

            // home: TeachersScreen()
          );
        },
      ),
    );
  }
}
