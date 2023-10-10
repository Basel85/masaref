import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/data/repositories/category_repository.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_states.dart';

class GetCategoriesOfSectionCubit extends Cubit<GetCategoriesOfSectionStates> {
  GetCategoriesOfSectionCubit() : super(GetCategoriesOfSectionInitialState());
  static GetCategoriesOfSectionCubit get(context) => BlocProvider.of(context);
  void getCategoriesOfSection({required sectionId}) async {
    try {
      final categories = await CategoryRepository.getCategoriesOfSpecificSection(sectionId: sectionId);
      emit(GetCategoriesOfSectionSuccessState(categories: categories,sectionId: sectionId));
    } catch (e) {
      emit(GetCategoriesOfSectionErrorState(errorMessage: e.toString()));
    }
  }
}
