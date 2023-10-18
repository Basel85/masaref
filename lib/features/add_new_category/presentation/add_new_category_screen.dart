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
import 'package:masaref/features/add_new_category/cubits/get_category_by_name/get_category_by_name_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/get_category_by_name/get_category_by_name_states.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_states.dart';
import 'package:masaref/features/add_new_category/presentation/widgets/app_bar_drop_down_button.dart';
import 'package:masaref/features/add_new_category/presentation/widgets/name_of_category.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';

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
      appBar: CustomAppBar(
        actions: [
          const AppBarDropDownButton(),
          SizedBox(width: 16.w),
        ],
      ),
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
                child: MultiBlocListener(
                  listeners: [
                    BlocListener<AddCategoryCubit, AddCategoryStates>(
                      listener: (context, addCategorystate) {
                        if (addCategorystate is AddCategorySuccessState) {
                          GetCategoryByNameCubit.get(context).getCategoryByName(
                              name: _categoryController.text);
                        } else if (addCategorystate is AddCategoryErrorState) {
                          showSnackBar(
                              context: context,
                              message: "خطأ",
                              backgroundColor: Colors.red);
                        }
                      },
                    ),
                    BlocListener<GetCategoryByNameCubit,
                        GetCategoryByNameStates>(
                      listener: (context, state) {
                        if (state is GetCategoryByNameSuccessState) {
                          showSnackBar(
                              context: context,
                              message: "تم",
                              backgroundColor: Colors.green);
                          BlocProvider.of<Mo3amalaCubit>(context)
                              .changeCategory(state.categoryModel);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          print("ddd");
                        } else if (state is GetCategoryByNameErrorState) {
                          showSnackBar(
                              context: context,
                              message: state.errorMessage,
                              backgroundColor: Colors.red);
                        }
                      },
                    ),
                  ],
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
