import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/enums.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_states.dart';
import 'package:masaref/features/add_new_category/presentation/widgets/add_new_category_switch.dart';
import 'package:masaref/features/add_new_category/presentation/widgets/app_bar_drop_down_button.dart';
import 'package:masaref/features/add_new_category/presentation/widgets/main_category.dart';
import 'package:masaref/features/add_new_category/presentation/widgets/name_of_category_or_subcategory.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/importance_section.dart';

class AddNewCategoryScreen extends StatelessWidget {
  const AddNewCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: AppBarDropDownButton()),
        body: BlocBuilder<GetMainTypeOfTransactionCubit,
            GetMainTypeOfTransactionStates>(
          builder: (_, state) => ListView(
            children: [
              SizedBox(
                height: 16.h,
              ),
              if (state is! GetMainTypeOfTransactionGetState ||
                  state.key != MainTypesOfTransactions.debt) ...{
                const AddNewCategorySwitch(),
                SizedBox(
                  height: 16.h,
                ),
              },
              const MainCategory(),
              SizedBox(
                height: 16.h,
              ),
              const NameOfCategoryOrSubCategory(),
              if (state is! GetMainTypeOfTransactionGetState ||
                  state.key == MainTypesOfTransactions.expense) ...{
                SizedBox(
                  height: 16.h,
                ),
                // const ImportanceSection(),
              },
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: CustomButton(title: "اضافة قسم ", onpress: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
