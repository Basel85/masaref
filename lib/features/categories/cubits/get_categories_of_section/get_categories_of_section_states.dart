import 'package:masaref/features/categories/data/category_model.dart';

abstract class GetCategoriesOfSectionStates {}

class GetCategoriesOfSectionInitialState extends GetCategoriesOfSectionStates {}

class GetCategoriesOfSectionSuccessState extends GetCategoriesOfSectionStates {
  final List<CategoryModel> categories;
  final int sectionId;
  GetCategoriesOfSectionSuccessState({required this.categories,required this.sectionId});
}

class GetCategoriesOfSectionErrorState extends GetCategoriesOfSectionStates {
  final String errorMessage;
  GetCategoriesOfSectionErrorState({required this.errorMessage});
}
