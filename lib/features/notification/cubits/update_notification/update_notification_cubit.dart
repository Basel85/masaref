import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/notification/cubits/update_notification/update_notification_states.dart';
import 'package:masaref/features/notification/data/repositories/notification_repository.dart';

class UpdateNotificationCubit extends Cubit<UpdateNotificationStates> {
  UpdateNotificationCubit() : super(UpdateNotificationInitialState());

  static UpdateNotificationCubit get(context) => BlocProvider.of(context);
  TimeOfDay _time = TimeOfDay.now();
  int _id = -1;
  bool _isSwitchedOn = false;
  TimeOfDay get time => _time;
  bool get isSwitchedOn => _isSwitchedOn;
  void setTime(String timeFromDB) {
    _time = TimeOfDay(
        hour: int.parse("${timeFromDB[0]}${timeFromDB[1]}"),
        minute: int.parse("${timeFromDB[3]}${timeFromDB[4]}"));
  }

  void setIsSwitchedOn(bool isSwitchedOn) {
    _isSwitchedOn = isSwitchedOn;
  }

  void setId(int id) {
    _id = id;
  }

  void updateNotification({bool isSwitchedOn = true, TimeOfDay? newTime}) {
    try {
      newTime ??= _time;
      if (_isSwitchedOn != isSwitchedOn || newTime != _time) {
        NotificationRepository.updateNotification(
            id: _id,
            currentDate: DateTime(2023, 1, 1, newTime.hour, newTime.minute),
            isSwitchedOn: isSwitchedOn ? 1 : 0);
        _time = newTime;
        _isSwitchedOn = isSwitchedOn;
        emit(UpdateNotificationSuccessState());
      }
    } catch (_) {
      emit(UpdateNotificationErrorState(errorMessage: "Something went wrong"));
    }
  }
}
