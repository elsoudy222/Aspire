part of 'famous_cubit.dart';

@immutable
abstract class FamousStates {}

class FamousInitialState extends FamousStates {}


class LoadingFamousState extends FamousStates {}
class SuccessFamousState extends FamousStates {}
class FailedFamousState extends FamousStates {
  final String error;
  FailedFamousState(this.error);
}


// ************ Send Famous Form Data: ***************
class LoadingSendFamousFormDataState extends FamousStates {}
class SuccessSendFamousFormDataState extends FamousStates {}
class FailedSendFamousFormDataState extends FamousStates {
  final String error;
  FailedSendFamousFormDataState(this.error);
}