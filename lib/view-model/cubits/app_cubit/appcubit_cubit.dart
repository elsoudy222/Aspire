import 'dart:ui';

import 'package:aspire_edu/core/constants/app_colors/app_colors.dart';
import 'package:aspire_edu/model/courses_model.dart';
import 'package:aspire_edu/model/famous_model.dart';
import 'package:aspire_edu/model/teachers_model.dart';
import 'package:aspire_edu/view-model/database/local/cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/home_model.dart';
import '../../../model/sent_form_model.dart';
import '../../../model/stage_levels_model.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'appcubit_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=> BlocProvider.of(context,);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  FocusNode fullNameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode notesFocus = FocusNode();


  late int currentLevelIndex;
  void changeLevelIndex(int index){
    currentLevelIndex = index;
    emit(ChangeLevelIndexState());
  }


  late int currentSubjectIndex;
  void changeSubjectIndex(int index){
    currentSubjectIndex = index;
    emit(ChangeSubjectIndexState());
  }

   int? currentTeacherIndex;
  void changeTeacherIndex(int index){
    currentTeacherIndex = index;
    emit(ChangeTeacherIndexState());
  }

  String teacherValue ="";
  bool isTeacherSelected = false;

  void teacherSelected(value){
    //index = currentTeacherIndex;
    isTeacherSelected = true;
    teacherValue = value;
    emit(SuccessSelectTeacherState());
    print(teacherValue);
    print(isTeacherSelected);
  }


  List<StageAndLevelsModel> stage= [
    StageAndLevelsModel(
        stage: 'المرحلة الابتدائية',
        levelTitle: [
          "الصف الاول",
          "الصف الثاني",
          "الصف الثالث",
          "الصف الرابع",
          "الصف خامس",
          "الصف السادس",
        ],
        levelTitleData: [
          "الصف الاول الابتدائي",
          "الصف الثانى الابتدائي",
          "الصف الثالث الابتدائي",
          "الصف الرابع الابتدائي",
          "الصف الخامس الابتدائي",
          "الصف السادس الابتدائي",
        ]
    ),
    StageAndLevelsModel(
      stage: 'المرحلة الاعدادية',
      levelTitle: [
        "الصف الاول",
        "الصف الثاني",
        "الصف الثالث",
      ],
      levelTitleData: [
        "الصف الاول الاعدادي",
        "الصف الثانى الاعدادي",
        "الصف الثالث الاعدادي",
      ],
    ),
    StageAndLevelsModel(
      stage: 'المرحلة الثانوية',
      levelTitle: [
        "الصف الاول",
        "الصف الثاني",
        "الصف الثالث",
      ],
      levelTitleData: [
        "الصف الاول الثانوى",
        "الصف الثانى الثانوى",
        "الصف الثالث الثانوى",
      ],
    ),
  ];


  String? section;
 bool sectionSelected = false;
final Color sectionTextColor = AppColors.primaryColor;



void arabicSelected(){
  sectionSelected = true;

  section = "arabic";

  emit(SuccessSelectArabicState());
 print(section);
 print(sectionSelected);

}
  void langSelected(){
    sectionSelected = true;
    section = "language" ;
    emit(SuccessSelectLanguageState());
    print(section);
    print(sectionSelected);

  }



  void getAllMaterials({
    required String lang,
    required String eduClass,
  }){

    emit(LoadingGetMaterialsState());
    print(lang);
    print(eduClass);
    DioHelper.postData(
        url: materials,
        data:{
          'lang':lang,
          'educlass':eduClass,
        }
    ).then((value){
      if(value.statusCode == 200){
        var material = value.data;

        emit(SuccessGetMaterialsState(material));

        print("Materials ************** ${value.data}");
      }
    }).catchError((error){
      print("Material Error ************** ${error}");
      emit(FailedGetMaterialsState(error.toString()));
    });
  }


 List <TeachersModel> teachersModel = [];
  void getAllTeachers({
    required String lang,
    required String eduClass,
    required String materialName
  }){
    emit(LoadingGetTeachersState());
    print(lang);
    print(eduClass);
    print(materialName);
    DioHelper.postData(
        url: teachers,
        data:{
          'lang':lang,
          'educlass':eduClass,
          "matrialNm" : materialName
        }
    ).then((value){
      for(var teacher in value.data){
        teachersModel.add(TeachersModel.fromJson(teacher));
      }
      emit(SuccessGetTeachersState());

      print("Teachers: ************** ${value.data}");

    }).catchError((error){

      print("Teachers Error ************** ${error}");
      emit(FailedGetTeachersState(error.toString()));
    });

  }



  void sendMaterialFormData({
    required String lang,
    required String eduClass,
    required String materialName,
    required String teacherName,
    required String studentName,
    required String studentNumber,
    required String notes,
  }){

    print(lang);
    print(eduClass);
    print(materialName);

    emit(LoadingSendMaterialFormDataState());
    DioHelper.postData(
        url: sendMaterialForm,
        data:{
          'lang':lang,
          'educlass':eduClass,
          "matrialNm" : materialName,
          "teacherName": teacherName,
          "clientName" :  studentName,
          "clientPhone": studentNumber,
          "message"  :  notes,
        }
    ).then((value){


        print("Success Sent Data : ************** ${value.data}");
        emit(SuccessSendMaterialFormDataState());

      // await Future.delayed(Duration(seconds: 5),(){
      //
      // });

    }
    ).catchError((error){

      print(" Error Send Data ************** ${error}");
      emit(FailedSendMaterialFormDataState(error.toString()));
    });

  }




}
