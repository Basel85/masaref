import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';

class WholeAppCubit extends Cubit<WholeAppStates> {
  WholeAppCubit() : super(WholeAppInitial());

  bool isdark = false;

  changeAppTheme() {
    isdark = !isdark;
    emit(WholeAppModeChange());
  }
}
