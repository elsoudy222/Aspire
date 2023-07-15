part of 'appcubit_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitialState extends AppStates {}
class LoadingBannersState extends AppStates {}
class SuccessBannersState extends AppStates {}
class FailedBannersState extends AppStates {
  final String error;
  FailedBannersState(this.error);
}



class LoadingFamousState extends AppStates {}
class SuccessFamousState extends AppStates {}
class FailedFamousState extends AppStates {
  final String error;
  FailedFamousState(this.error);
}


class LoadingCoursesState extends AppStates {}
class SuccessCoursesState extends AppStates {}
class FailedCoursesState extends AppStates {
  final String error;
  FailedCoursesState(this.error);
}


class LoadingGetMaterialsState extends AppStates {}
class SuccessGetMaterialsState extends AppStates {}
class FailedGetMaterialsState extends AppStates {
  final String error;
  FailedGetMaterialsState(this.error);
}