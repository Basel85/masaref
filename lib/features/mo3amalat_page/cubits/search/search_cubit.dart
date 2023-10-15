import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/features/mo3amalat_page/cubits/search/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  void search(String text, List<String> categorynamesList) {
    emit(SearchSearchedState(
        searchedList: categorynamesList
            .where((categoryName) => categoryName.contains(text))
            .toList()
            .cast<String>()));
  }
}
