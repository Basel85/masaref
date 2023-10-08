import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class RepeatSection extends StatelessWidget {
  const RepeatSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        border: Border(
          bottom: BorderSide(
            color: AppColors.colorBlack.withOpacity(0.5),
          ),
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'تكرار المعاملة',
                  style: AppStyles.textStyle24w400.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10.w),
                const Icon(Icons.arrow_drop_down, size: 30),
                SizedBox(width: 5.w),
                Text(
                  'شهريا',
                  style: AppStyles.textStyle24w400.copyWith(
                    fontSize: 10.sp,
                  ),
                ),
                const Spacer(),
                Switch.adaptive(
                  activeColor: AppColors.primaryColor,
                  value: true,
                  onChanged: (value) {
                    value = !value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'التنبيه بالمعاملة',
                  style: AppStyles.textStyle24w400.copyWith(
                    fontSize: 10.sp,
                  ),
                ),
                const Spacer(),
                Switch.adaptive(
                  activeColor: AppColors.primaryColor,
                  value: false,
                  onChanged: (value) {
                    value = !value;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}