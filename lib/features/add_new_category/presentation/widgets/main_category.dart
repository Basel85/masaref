import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_list_tile.dart';
import 'package:masaref/core/widgets/get_error_message.dart';
import 'package:masaref/features/add_new_category/cubits/main_category/main_category_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/main_category/main_category_states.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_cubit.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_states.dart';

class MainCategory extends StatefulWidget {
  final int sectionId;
  const MainCategory({super.key, required this.sectionId});

  @override
  State<MainCategory> createState() => _MainCategoryState();
}

class _MainCategoryState extends State<MainCategory> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: AppColors.colorWhite,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                GetCategoriesOfSectionCubit.get(context)
        .getCategoriesOfSection(sectionId: widget.sectionId);
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: BlocBuilder<GetCategoriesOfSectionCubit,
                      GetCategoriesOfSectionStates>(builder: (_, state) {
                    if (state is GetCategoriesOfSectionSuccessState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                            state.categories.length,
                            (index) => GestureDetector(
                              onTap: () {
                                MainCategoryCubit.get(context)
                                    .updateMainCategory(
                                        title: state.categories[index].name,
                                        image: state.categories[index].image,
                                        id: state.categories[index].id
                                        );
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 16.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.colorWhite,
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[300]!,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: CustomListTile(
                                    title: state.categories[index].name,
                                    textColor: AppColors.colorBlack,
                                    image: state.categories[index].image,
                                  )),
                            ),
                          )
                        ],
                      );
                    } else if (state is GetCategoriesOfSectionErrorState) {
                      return GetErrorMessage(
                          errorMessage: state.errorMessage,
                          onPressed: () {
                            GetCategoriesOfSectionCubit.get(context)
                                .getCategoriesOfSection(
                                    sectionId: widget.sectionId);
                          });
                    } else {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                  }),
                );
              });
        },
        child: BlocBuilder<MainCategoryCubit, MainCategoryStates>(
          builder: (_, state) => CustomListTile(
            imageRadius: 25.r,
            title: state is MainCategoryChangedState
                ? state.title
                : 'القسم الرئيسي',
            textColor: AppColors.colorGrey,
            backgroundColor: AppColors.colorGrey,
            image: state is MainCategoryChangedState ? state.image : "",
          ),
        ),
      ),
    );
  }
}
