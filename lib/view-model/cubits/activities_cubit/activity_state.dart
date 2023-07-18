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