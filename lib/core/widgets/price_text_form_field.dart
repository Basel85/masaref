import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/price_check.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';

class PriceTextFormField extends StatelessWidget with PriceCheck {
  final TextEditingController priceController;
  const PriceTextFormField({super.key, required this.priceController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Text(
              "ج.م",
              style: TextStyle(
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: CustomFormField(
              controller: priceController,
              hinttext: " المبلغ",
              inputStyle: TextStyle(
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
              hintsize: 14.sp,
              validator: (value) {
                return checkPrice(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
