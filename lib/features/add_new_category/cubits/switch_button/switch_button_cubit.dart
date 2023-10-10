import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/add_new_category/cubits/switch_button/switch_button_states.dart';

class SwitchButtonCubit extends Cubit<SwitchButtonStates> {
  SwitchButtonCubit() : super(SwitchButtonInitialState());
  static SwitchButtonCubit get(context) => BlocProvider.of(context);
  void switchButton({required bool value}) {
    emit(SwitchButtonChangedState(value: value));
  }
}

