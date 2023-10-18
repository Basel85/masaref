import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/category_repository.dart';
import 'package:masaref/features/add_new_category/cubits/add_category/add_category_states.dart';
import 'package:sqflite/sqflite.dart';

class AddCategoryCubit extends Cubit<AddCategoryStates> {
  AddCategoryCubit() : super(AddCategoryInitialState());
  static AddCategoryCubit get(context) => BlocProvider.of(context);
  void addCategory(
      {required String name,
      required String imagePath,
      required int sectionid}) {
    try {
      CategoryRepository.addCategory(
          name: name, imagePath: imagePath, sectionid: sectionid);
      emit(AddCategorySuccessState());
    } on DatabaseException catch (e) {
      emit(AddCategoryErrorState(errorMessage: e.toString()));
    } catch (_) {
      emit(AddCategoryErrorState(errorMessage: "Something went wrong"));
    }
  }
}
