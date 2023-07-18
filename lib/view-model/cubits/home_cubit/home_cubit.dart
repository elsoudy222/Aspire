import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/constants/data/data.dart';
import '../../../model/home_model.dart';
import '../../../view/home/model/home_model.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<CardsModel> cards = [
    CardsModel(
      title: "الدروس",
      image: "assets/svg/Lessons.svg",
    ),
    CardsModel(
      title: "الكورسات",
      image: "assets/svg/Courses.svg",
    ),
    CardsModel(
      title: "مشاهير",
      image: "assets/svg/famous.svg",
    ),
    CardsModel(
      title: "انشطة اخرى",
      image: "assets/svg/activity.svg",
    ),
  ];
  List<String> screens = [
    stagesScreen,
    coursesScreen,
    famousScreen,
    activityScreen,
  ];


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
}
