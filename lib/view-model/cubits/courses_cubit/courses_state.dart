part of 'courses_cubit.dart';

@immutable
abstract class CoursesStates {}

class CoursesInitialState extends CoursesStates {}

class LoadingCoursesState extends CoursesStates {}
class SuccessCoursesState extends CoursesStates {}
class FailedCoursesState extends CoursesStates {
  final String error;
  FailedCoursesState(this.error);
}


// ************ Send Courses Form Data: ***************
class LoadingSendCourseFormDataState extends CoursesStates {}
class SuccessSendCourseFormDataState extends CoursesStates {}
class FailedSendCourseFormDataState extends CoursesStates {
  final String error;
  FailedSendCourseFormDataState(this.error);
}