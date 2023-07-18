import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/courses_model.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesStates> {
  CoursesCubit() : super(CoursesInitialState());

  static CoursesCubit get(context) => BlocProvider.of(context);

  List<CoursesModel> courseModel = [];
  void getAllCourses() {
    emit(LoadingCoursesState());
    DioHelper.getData(
      url: courses,
    ).then((value) {

      for(var course in value.data ){
        courseModel.add(CoursesModel.fromJson(course));
      }
      print(courseModel.toString());

      emit(SuccessCoursesState());

    }).catchError((error) {
      print(error.toString());
      emit(FailedCoursesState(error.toString()));
    });
  }
}
