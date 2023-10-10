abstract class MainCategoryStates {}

class MainCategoryInitialState extends MainCategoryStates {}

class MainCategoryChangedState extends MainCategoryStates {
  final String title;
  final String image;
  MainCategoryChangedState({required this.title, required this.image});
}
