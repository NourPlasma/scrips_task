import 'package:flutter/foundation.dart';

@immutable
abstract class CoreStates
{
  CoreStates();
}

class InitialCounterState extends CoreStates {}

class SuccessCounterState extends CoreStates
{
  SuccessCounterState();
}
