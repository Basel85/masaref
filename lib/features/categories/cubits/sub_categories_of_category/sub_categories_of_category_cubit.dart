import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/category_repository.dart';
import 'package:masaref/features/categories/cubits/sub_categories_of_category/sub_categories_of_category_states.dart';

class SubCategoriesOfCategoryCubit extends Cubit<SubCategoriesOfCategoryStates> {
  SubCategoriesOfCategoryCubit() : super(SubCategoriesOfCategoryInitialState());
  static SubCategoriesOfCategoryCubit get(context) => BlocProvider.of(context);
  void getSubCategoriesOfSpecificCategory({required int categoryId}) async {
   try {
     final subCategories = await CategoryRepository.getSubCategoriesOfSpecificCategory(categoryId: categoryId);
     emit(SubCategoriesOfCategorySuccessState(subCategories: subCategories));
   } catch (e) {
     emit(SubCategoriesOfCategoryErrorState(errorMessage: e.toString()));
   }
  }
}
