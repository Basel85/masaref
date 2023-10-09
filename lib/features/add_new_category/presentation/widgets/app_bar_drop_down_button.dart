import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_states.dart';

class AppBarDropDownButton extends StatelessWidget {
  const AppBarDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (_) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      GetMainTypeOfTransactionCubit.get(context).types.length,
                      (index) => GestureDetector(
                        onTap: () {
                          GetMainTypeOfTransactionCubit.get(context)
                              .getTheMainTypeOfTransaction(
                                  GetMainTypeOfTransactionCubit.get(context)
                                      .types
                                      .keys
                                      .toList()[index]);
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
                          child: Text(
                            GetMainTypeOfTransactionCubit.get(context)
                                .types
                                .values
                                .toList()[index],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
            size: 24.r,
          ),
          BlocBuilder<GetMainTypeOfTransactionCubit,
              GetMainTypeOfTransactionStates>(
            builder: (_, state) => Text(
              state is GetMainTypeOfTransactionGetState
                  ? GetMainTypeOfTransactionCubit.get(context).types[state.key]!
                  : "المصروف",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
