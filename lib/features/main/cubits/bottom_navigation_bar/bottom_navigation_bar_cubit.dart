import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/main/cubits/bottom_navigation_bar/bottom_navigation_bar_states.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarStates> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());
  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);
  void update({required int index}) {
    emit(BottomNavigationBarChangedState(index: index));
  }
}
