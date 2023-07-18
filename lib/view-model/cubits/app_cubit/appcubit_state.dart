part of 'appcubit_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitialState extends AppStates {}

class SuccessSelectArabicState extends AppStates {}
class SuccessSelectLanguageState extends AppStates {}
class SuccessSelectTeacherState extends AppStates {}


class ChangeLevelIndexState extends AppStates {}
class ChangeSubjectIndexState extends AppStates {}
class ChangeTeacherIndexState extends AppStates {}


// ************ Get All Materials: ***************
class LoadingGetMaterialsState extends AppStates {}
class SuccessGetMaterialsState extends AppStates {
  final List<dynamic> materials;
  SuccessGetMaterialsState(this.materials);
}
class FailedGetMaterialsState extends AppStates {
  final String error;
  FailedGetMaterialsState(this.error);
}

// ************ Get All Teachers: ***************
class LoadingGetTeachersState extends AppStates {}
class SuccessGetTeachersState extends AppStates {}
class FailedGetTeachersState extends AppStates {
  final String error;
  FailedGetTeachersState(this.error);
}