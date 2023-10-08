import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';

class PriceTextFormField extends StatelessWidget {
  const PriceTextFormField({super.key});

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
            child: const Text("ج.م"),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: CustomFormField(
              hinttext: " المبلغ",
              hintsize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
