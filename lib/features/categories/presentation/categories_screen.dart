import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/features/add_new_category/cubits/add_category/add_category_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/main_category/main_category_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/switch_button/switch_button_cubit.dart';
import 'package:masaref/features/add_new_category/presentation/add_new_category_screen.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_cubit.dart';
import 'package:masaref/features/categories/presentation/widgets/categories_body.dart';
import 'package:masaref/features/categories/presentation/widgets/custom_tab_bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // final TabController _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
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
          body: TabBarView(
            children: [
              BlocProvider<GetCategoriesOfSectionCubit>(
                create: (context) => GetCategoriesOfSectionCubit(),
                child: const CategoriesBody(
                  sectionId: 1,
                ),
              ),
              BlocProvider<GetCategoriesOfSectionCubit>(
                create: (context) => GetCategoriesOfSectionCubit(),
                child: const CategoriesBody(
                  sectionId: 2,
                ),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return MultiBlocProvider(
                  providers: [
                    
                    BlocProvider<GetMainTypeOfTransactionCubit>(
                      create: (_) => GetMainTypeOfTransactionCubit(),
                    ),
                    
                    BlocProvider<MainCategoryCubit>(
                      create: (context) => MainCategoryCubit()),
                    BlocProvider<AddCategoryCubit>(create: (_) => AddCategoryCubit()),
                    BlocProvider<SwitchButtonCubit>(
                  create: (context) => SwitchButtonCubit(),)
                  ],
                  child: const AddNewCategoryScreen(),
                );
              }));
            },
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 24.r,
            ),
          ),
        ),
      ),
    );
  }
}
