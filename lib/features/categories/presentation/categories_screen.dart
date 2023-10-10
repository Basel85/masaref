import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_cubit.dart';
import 'package:masaref/features/categories/presentation/widgets/categories_body.dart';
import 'package:masaref/features/categories/presentation/widgets/custom_tab_bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
            sizeFromHeight: 100.h,
            backgroundColor: AppColors.colorGrey,
            title: Text(
              'الاقسام',
              style: TextStyle(
                  color: AppColors.colorBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0), child: CustomTabBar())),
        body: DefaultTabController(
          length: 2,
          child: TabBarView(
            children: [
              BlocProvider<GetCategoriesOfSectionCubit>(
                create: (context) => GetCategoriesOfSectionCubit()
                  ..getCategoriesOfSection(sectionId: 1),
                child: const CategoriesBody(),
              ),
             BlocProvider<GetCategoriesOfSectionCubit>(
                create: (context) => GetCategoriesOfSectionCubit()
                  ..getCategoriesOfSection(sectionId: 2),
                child: const CategoriesBody(),
              ),,
            ],
          ),
        ),
      ),
    );
  }
}
