import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/notification/cubits/time/time_states.dart';

class TimeCubit extends Cubit<TimeStates> {
  TimeCubit() : super(TimeInitialState());

  static TimeCubit get(context) => BlocProvider.of(context);

  TimeOfDay time = TimeOfDay.now();

  void changeTime(TimeOfDay? newTime) {
    if (newTime != null && time != newTime) {
      time = newTime;
      emit(TimeChangedState(time: time));
    }
  }
}
