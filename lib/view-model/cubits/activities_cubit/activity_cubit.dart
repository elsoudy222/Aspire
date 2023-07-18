import 'package:aspire_edu/model/activities_model.dart';
import 'package:aspire_edu/view-model/database/network/end_points.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../database/network/dio_helper.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityStates> {
  ActivityCubit() : super(ActivityInitialState());

  static ActivityCubit get(context)=> BlocProvider.of(context);


  List<ActivitiesModel> activityModel = [];
  void getAllActivities() {
    emit(LoadingActivitiesState());
    DioHelper.getData(
      url: activities,
    ).then((value) {

      for(var activity in value.data ){
        activityModel.add(ActivitiesModel.fromJson(activity));
      }
      print(activityModel.toString());

      emit(SuccessActivitiesState());

    }).catchError((error) {
      print(error.toString());
      emit(FailedActivitiesState(error.toString()));
    });
  }


}