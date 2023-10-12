import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_cubit.dart';
import 'package:masaref/core/utils/enums.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/features/add_new_category/cubits/add_category/add_category_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/add_category/add_category_states.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_states.dart';
import 'package:masaref/features/add_new_category/presentation/widgets/app_bar_drop_down_button.dart';
import 'package:masaref/features/add_new_category/presentation/widgets/name_of_category.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_cubit.dart';

class AddNewCategoryScreen extends StatefulWidget {
  const AddNewCategoryScreen({super.key});

  @override
  State<AddNewCategoryScreen> createState() => _AddNewCategoryScreenState();
}

class _AddNewCategoryScreenState extends State<AddNewCategoryScreen>
    with SnackBarViewer {
  final TextEditingController _categoryController = TextEditingController();
  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(actions: [
        const AppBarDropDownButton(),
        SizedBox(width: 16.w),
      ]),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<GetMainTypeOfTransactionCubit,
            GetMainTypeOfTransactionStates>(
          builder: (_, state) => ListView(
            children: [
              SizedBox(
                height: 16.h,
              ),
              NameOfCategory(
                categoryController: _categoryController,
              ),
              if (state is! GetMainTypeOfTransactionGetState ||
                  state.key == MainTypesOfTransactions.expense) ...{
                SizedBox(
                  height: 16.h,
                ),
                // const ImportanceSection(cubit: BlocProvider.of(context),),
              },
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: BlocListener<AddCategoryCubit, AddCategoryStates>(
                  listener: (context, addCategorystate) {
                    if (addCategorystate is AddCategorySuccessState) {
                      showSnackBar(
                          context: context,
                          message: "Done",
                          backgroundColor: Colors.green);
                      GetCategoriesOfSectionCubit.get(context)
                          .getCategoriesOfSection(
                        sectionId: state is GetMainTypeOfTransactionGetState
                            ? GetMainTypeOfTransactionCubit.get(context)
                                    .types
                                    .keys
                                    .toList()
                                    .indexOf(state.key) +
                                1
                            : 1,
                      );
                    } else if (addCategorystate is AddCategoryErrorState) {
                      showSnackBar(
                          context: context,
                          message: "Error",
                          backgroundColor: Colors.red);
                    }
                  },
                  child: CustomButton(
                      title: "اضافة قسم ",
                      onpress: () {
                        AddCategoryCubit.get(context).addCategory(
                            name: _categoryController.text,
                            imagePath:
                                ImagePickerCubit.get(context).imagePath ?? "",
                            sectionid: state is GetMainTypeOfTransactionGetState
                                ? GetMainTypeOfTransactionCubit.get(context)
                                        .types
                                        .keys
                                        .toList()
                                        .indexOf(state.key) +
                                    1
                                : 1);
                      }),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
