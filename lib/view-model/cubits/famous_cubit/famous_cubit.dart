import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/famous_model.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'famous_state.dart';

class FamousCubit extends Cubit<FamousStates> {
  FamousCubit() : super(FamousInitialState());

  static FamousCubit get(context) => BlocProvider.of(context);

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




  void sendFamousFormData({
    required String famousName,
    required String studentName,
    required String studentNumber,
    required String notes,
  }){
    emit(LoadingSendFamousFormDataState());
    DioHelper.postData(
        url: sendFamousForm,
        data:{
          "celeName"  : famousName,
          "clientName" : studentName ,
          "clientPhone": studentNumber,
          "message"  :  notes,
        }
    ).then((value){
      print("Success Sent Famous Data : ************** ${value.data}");
      emit(SuccessSendFamousFormDataState());
      // await Future.delayed(Duration(seconds: 5),(){
      //
      // });
    }
    ).catchError((error){
      print(" Error Send Data ************** ${error}");
      emit(FailedSendFamousFormDataState(error.toString()));
    });

  }

}
