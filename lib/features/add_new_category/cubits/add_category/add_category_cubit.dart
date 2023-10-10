import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/category_repository.dart';
import 'package:masaref/features/add_new_category/cubits/add_category/add_category_states.dart';

class AddCategoryCubit extends Cubit<AddCategoryStates> {
  AddCategoryCubit() : super(AddCategoryInitialState());
  static AddCategoryCubit get(context) => BlocProvider.of(context);
  void addCategory(
      {required bool isCategory,
      required String name,
      required String imagePath,
      required int id}) {
    try {
      CategoryRepository.addCategoryOrSubCategory(
          isCategory: isCategory, name: name, imagePath: imagePath, id: id);
      emit(AddCategorySuccessState());
    } catch (e) {
      emit(AddCategoryErrorState(errorMessage: e.toString()));
    }
  }
}
