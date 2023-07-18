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
