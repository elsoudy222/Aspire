import 'package:aspire_edu/view-model/cubits/activities_cubit/activity_cubit.dart';
import 'package:aspire_edu/view-model/cubits/app_cubit/appcubit_cubit.dart';
import 'package:aspire_edu/view-model/cubits/courses_cubit/courses_cubit.dart';
import 'package:aspire_edu/view-model/cubits/famous_cubit/famous_cubit.dart';
import 'package:aspire_edu/view-model/cubits/home_cubit/home_cubit.dart';
import 'package:aspire_edu/view-model/database/local/cache_helper.dart';
import 'package:aspire_edu/view-model/database/network/dio_helper.dart';
import 'package:aspire_edu/view/TEST_APIS/test_apis.dart';
import 'package:aspire_edu/view/activities/activites_screen.dart';
import 'package:aspire_edu/view/courses/courses_screen.dart';
import 'package:aspire_edu/view/famous/famous_screen.dart';
import 'package:aspire_edu/view/home/home_screen.dart';
import 'package:aspire_edu/view/lessons/lessons_screen.dart';
import 'package:aspire_edu/view/levels/levels_screen.dart';
import 'package:aspire_edu/view/splash/first_splash_screen.dart';
import 'package:aspire_edu/view/splash/second_splash_screen.dart';
import 'package:aspire_edu/view/stages/stages_screen.dart';
import 'package:aspire_edu/view/teachers/teachers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/constants/data/data.dart';
import 'model/home_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AppCubit(),),
      BlocProvider(create: (context) => HomeCubit()..getBanners(),),
      BlocProvider(create: (context) => ActivityCubit()..getAllActivities(),),
      BlocProvider(create: (context) => FamousCubit()..getFamous(),),
      BlocProvider(create: (context) => CoursesCubit()..getAllCourses()),

    ],
    child: const MyApp(),

  ),
  );
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
            //  lessonsScreen : (context) => LessonsScreen(),
              famousScreen : (context) => FamousScreen(),
              coursesScreen : (context) => CoursesScreen(),
              activityScreen : (context) => ActivitiesScreen(),
            },

            // home: HomeScreen()
          );
        },
      ),
    );
  }
}
