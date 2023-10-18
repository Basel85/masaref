import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/widgets/get_error_message.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_cubit.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_states.dart';
import 'package:masaref/features/categories/presentation/widgets/category_list_tile.dart';
import 'package:masaref/features/mo3amalat_page/cubits/search/search_cubit.dart';
import 'package:masaref/features/mo3amalat_page/cubits/search/search_states.dart';
import 'package:masaref/features/mo3amalat_page/presentation/view/widgets/search_field.dart';

class CategoriesBody extends StatefulWidget {
  final int sectionId;
  const CategoriesBody({
    super.key,
    required this.sectionId,
  });

  @override
  State<CategoriesBody> createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    GetCategoriesOfSectionCubit.get(context)
        .getCategoriesOfSection(sectionId: widget.sectionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<GetCategoriesOfSectionCubit,
        GetCategoriesOfSectionStates>(
      builder: (_, state) {
        if (state is GetCategoriesOfSectionSuccessState) {
          List<String> categoryNames = state.categories
              .map((category) => category.name)
              .toList()
              .cast<String>();
          return Column(
            children: [
              SearchField(categorynamesList: categoryNames),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchStates>(
                  builder: (context, searchState) {
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        return CategoryListTile(
                          title: searchState is SearchSearchedState
                              ? state
                                  .categories[categoryNames
                                      .indexOf(searchState.searchedList[index])]
                                  .name
                              : state.categories[index].name,
                          image: searchState is SearchSearchedState
                              ? state
                                  .categories[categoryNames
                                      .indexOf(searchState.searchedList[index])]
                                  .image
                              : state.categories[index].image,
                          model: searchState is SearchSearchedState
                              ? state.categories[categoryNames
                                  .indexOf(searchState.searchedList[index])]
                              : state.categories[index],
                        );
                      },
                      itemCount: searchState is SearchSearchedState
                          ? searchState.searchedList.length
                          : state.categories.length,
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is GetCategoriesOfSectionErrorState) {
          return GetErrorMessage(
              errorMessage: state.errorMessage,
              onPressed: () {
                GetCategoriesOfSectionCubit.get(context)
                    .getCategoriesOfSection(sectionId: widget.sectionId);
              });
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
