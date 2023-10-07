import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';

class MoneySection extends StatelessWidget {
  const MoneySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.w),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColors.colorBlack.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 35.h,
            width: 40.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'ج.م',
                style: AppStyles.textStyle24w400.copyWith(fontSize: 10.sp),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: SizedBox(
              height: 45.h,
              child: CustomFormField(
                inputStyle: AppStyles.textStyle24w400.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 20.sp,
                ),
                inputType: TextInputType.number,
                hinttext: 'المبلغ',
                hintsize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
