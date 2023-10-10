abstract class AddCategoryStates {}
class AddCategoryInitialState extends AddCategoryStates {}
class AddCategorySuccessState extends AddCategoryStates {}
class AddCategoryErrorState extends AddCategoryStates {
  final String errorMessage;
  AddCategoryErrorState({required this.errorMessage});
}