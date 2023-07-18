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