import 'package:masaref/features/categories/data/category_model.dart';

abstract class GetCategoryByNameStates {}
class GetCategoryByNameInitialState extends GetCategoryByNameStates{}
class GetCategoryByNameSuccessState extends GetCategoryByNameStates{
  final CategoryModel categoryModel;
  GetCategoryByNameSuccessState({required this.categoryModel});
}
class GetCategoryByNameErrorState extends GetCategoryByNameStates{
  final String errorMessage;
  GetCategoryByNameErrorState({required this.errorMessage});
}