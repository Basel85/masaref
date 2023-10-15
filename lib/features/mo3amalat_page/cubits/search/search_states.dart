abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchSearchedState extends SearchStates {
  final List<String> searchedList;
  SearchSearchedState({required this.searchedList});
}
