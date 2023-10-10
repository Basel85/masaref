import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_state.dart';

class Mo3amalaCubit extends Cubit<Mo3amalaState> {
  Mo3amalaCubit() : super(Mo3amalaInitial());

  bool repeatChange = false;
  bool change = false;
  int importanceIndex = 0;
  DateTime transDate = DateTime.now();
  TimeOfDay transTime = TimeOfDay.now();

  chooseDate(DateTime? date) {
    transDate = date ?? transDate;
    emit(Mo3amalaRepeatSwitch());
  }

  chooseTime(TimeOfDay? time) {
    transTime = time ?? transTime;
    emit(Mo3amalaRepeatSwitch());
  }

  switCh() {
    repeatChange = !repeatChange;
    emit(Mo3amalaRepeatSwitch());
  }

  sWitCh() {
    change = !change;
    emit(Mo3amalaRepeatSwitch());
  }

  importance(int index) {
    importanceIndex = index;
    emit(Mo3amalaImportance());
  }
}
