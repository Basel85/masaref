import 'package:masaref/features/categories/data/sub_category_model.dart';

abstract class SubCategoriesOfCategoryStates {}
class SubCategoriesOfCategoryInitialState extends SubCategoriesOfCategoryStates {}
class SubCategoriesOfCategorySuccessState extends SubCategoriesOfCategoryStates {
  final List<SubCategoryModel> subCategories;
  SubCategoriesOfCategorySuccessState({required this.subCategories});
}
class SubCategoriesOfCategoryErrorState extends SubCategoriesOfCategoryStates {
  final String errorMessage;
  SubCategoriesOfCategoryErrorState({required this.errorMessage});
}