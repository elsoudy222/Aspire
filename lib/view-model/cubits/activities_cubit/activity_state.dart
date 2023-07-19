part of 'activity_cubit.dart';

@immutable
abstract class ActivityStates {}

class ActivityInitialState extends ActivityStates {}

class LoadingActivitiesState extends ActivityStates {}
class SuccessActivitiesState extends ActivityStates {}
class FailedActivitiesState extends ActivityStates {
  final String error;
  FailedActivitiesState(this.error);
}

// ************ Send Activity Form Data: ***************
class LoadingSendActivityFormDataState extends ActivityStates {}
class SuccessSendActivityFormDataState extends ActivityStates {}
class FailedSendActivityFormDataState extends ActivityStates {
  final String error;
  FailedSendActivityFormDataState(this.error);
}