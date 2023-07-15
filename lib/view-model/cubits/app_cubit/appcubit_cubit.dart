import 'package:aspire_edu/model/courses_model.dart';
import 'package:aspire_edu/model/famous_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/home_model.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'appcubit_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context)=> BlocProvider.of(context);



  List<BannersModel> bannersModel =[];
  void getBanners() {
    emit(LoadingBannersState());
    DioHelper.getData(
      url: newFeed,
    ).then((value) {
      for(var banner in value.data ){
        bannersModel.add(BannersModel.fromJson(banner));
      }

      print(bannersModel.toString());

      emit(SuccessBannersState());

    }).catchError((error) {
      print(error.toString());
      emit(FailedBannersState(error.toString()));
    });
  }



 List<FamousModel> famousModel = [];
  void getFamous() {
    emit(LoadingFamousState());
    DioHelper.getData(
      url: famous,
    ).then((value) {

      for(var famous in value.data ){
        famousModel.add(FamousModel.fromJson(famous));
      }
      print(famousModel.toString());

      emit(SuccessFamousState());

    }).catchError((error) {
      print(error.toString());
      emit(FailedFamousState(error.toString()));
    });
  }


  List<CoursesModel> courseModel = [];
  void getAllCourses() {
    emit(LoadingFamousState());
    DioHelper.getData(
      url: courses,
    ).then((value) {

      for(var famous in value.data ){
        courseModel.add(CoursesModel.fromJson(famous));
      }
      print(courseModel.toString());

      emit(SuccessFamousState());

    }).catchError((error) {
      print(error.toString());
      emit(FailedFamousState(error.toString()));
    });
  }




  List<String> materialModel =[];
  void getAllMaterials({
    required String lang,
    required String eduClass,
  }){

    emit(LoadingGetMaterialsState());
    DioHelper.postData(
        url: materials,
        data:{
          'lang':lang,
          'educlass':eduClass,
        }
    ).then((value){
      materialModel.addAll(value.data);
      print("DAta ************** ${value.data}");
      print("Data Materials ************** ${materialModel}");
      emit(SuccessGetMaterialsState());
    }).catchError((error){
      emit(FailedGetMaterialsState(error.toString()));
    });

  }





}
