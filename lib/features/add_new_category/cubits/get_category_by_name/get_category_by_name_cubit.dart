import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/category_repository.dart';
import 'package:masaref/features/add_new_category/cubits/get_category_by_name/get_category_by_name_states.dart';

class GetCategoryByNameCubit extends Cubit<GetCategoryByNameStates> {
  GetCategoryByNameCubit() : super(GetCategoryByNameInitialState());
  static GetCategoryByNameCubit get(context) => BlocProvider.of(context);
  void getCategoryByName({required String name}) async{
    try {
     final categoryModel = await CategoryRepository.getCategoryByName(name: name);
     emit(GetCategoryByNameSuccessState(categoryModel: categoryModel));
    } catch (e) {
      emit(GetCategoryByNameErrorState(errorMessage: "Something went wrong"));
    }
  }

}
