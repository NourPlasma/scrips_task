import 'package:flutter/foundation.dart';

@immutable
abstract class HomeStates
{
  const HomeStates();
}

class InitialCounterState extends HomeStates {}

class SuccessToggleMenu extends HomeStates{}

class SuccessToggleSearchFilter extends HomeStates{}

class SuccessSelectPractitioner extends HomeStates{}
class SuccessRemovePractitioner extends HomeStates{}
class SuccessUpdateRange extends HomeStates{}
class SuccessUpdateFilter extends HomeStates{}
class SuccessUpdateAppointmentFilter extends HomeStates{}
