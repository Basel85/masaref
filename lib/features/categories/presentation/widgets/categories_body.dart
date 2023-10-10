import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/widgets/get_error_message.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_cubit.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_states.dart';
import 'package:masaref/features/categories/cubits/sub_categories_of_category/sub_categories_of_category_cubit.dart';
import 'package:masaref/features/categories/presentation/widgets/category_list_tile.dart';

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
      // buildWhen: (previous, current) =>
      //     (current is GetCategoriesOfSectionSuccessState &&
      //         current.sectionId == widget.sectionId) ||
      //     current is GetCategoriesOfSectionErrorState,
      builder: (_, state) {
        if (state is GetCategoriesOfSectionSuccessState) {
          return ListView.builder(
            itemBuilder: (_, index) {
              return BlocProvider<SubCategoriesOfCategoryCubit>(
                create: (context) => SubCategoriesOfCategoryCubit()
                  ..getSubCategoriesOfSpecificCategory(
                      categoryId: state.categories[index].id),
                child: CategoryListTile(
                  title: state.categories[index].name,
                  image: state.categories[index].image,
                ),
              );
            },
            itemCount: state.categories.length,
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
