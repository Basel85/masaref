import 'package:flutter/material.dart';

abstract class TimeStates {}
class TimeInitialState extends TimeStates {}
class TimeChangedState extends TimeStates {
  final TimeOfDay time;
  TimeChangedState({required this.time});
}
