import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/add_new_wallet/cubits/check_box/check_box_states.dart';

class CheckBoxCubit extends Cubit<CheckBoxStates> {
  CheckBoxCubit() : super(CheckBoxInitialState());
  static CheckBoxCubit get(context) => BlocProvider.of(context);
  void update({required bool isChecked}) {
    emit(CheckBoxChangedState(isChecked: isChecked));
  }
}