part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}



class LoadingBannersState extends HomeStates {}
class SuccessBannersState extends HomeStates {}
class FailedBannersState extends HomeStates {
  final String error;
  FailedBannersState(this.error);
}