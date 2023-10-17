import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/notification/cubits/switch_button/switch_button_states.dart';

class SwitchButtonCubit extends Cubit<SwitchButtonStates> {
  SwitchButtonCubit() : super(SwitchButtonInitialState());
  static SwitchButtonCubit get(context) => BlocProvider.of(context);
  bool _isSwitchedOn = false;
  bool get isSwitchedOn => _isSwitchedOn;
  void switchButton({required bool value}) {
    _isSwitchedOn = value;
    emit(SwitchButtonChangedState(value: value));
  }
}

