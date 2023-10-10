import 'package:masaref/features/categories/data/category_model.dart';

abstract class GetCategoriesOfSectionStates {}

class GetCategoriesOfSectionInitialState extends GetCategoriesOfSectionStates {}

class GetCategoriesOfSectionSuccessState extends GetCategoriesOfSectionStates {
  final List<CategoryModel> categories;
  GetCategoriesOfSectionSuccessState({required this.categories});
}

class GetCategoriesOfSectionErrorState extends GetCategoriesOfSectionStates {
  final String errorMessage;
  GetCategoriesOfSectionErrorState({required this.errorMessage});
}
