import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_state.dart';

class Mo3amalaCubit extends Cubit<Mo3amalaState> {
  Mo3amalaCubit() : super(Mo3amalaInitial());
  bool repeatChange = false;
  bool change = false;
  int importanceIndex = 0;

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
