import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/add_new_category/cubits/main_category/main_category_states.dart';

class MainCategoryCubit extends Cubit<MainCategoryStates> {
  MainCategoryCubit() : super(MainCategoryInitialState());
  int _id = -1;
  int get id => _id;
  static MainCategoryCubit get(context) => BlocProvider.of(context);
  void updateMainCategory(
      {required String title, required String image, required int id}) {
    _id = id;
    emit(MainCategoryChangedState(title: title, image: image));
  }
}
