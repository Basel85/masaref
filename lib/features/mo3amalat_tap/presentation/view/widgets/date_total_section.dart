import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class DateAndTotalSection extends StatelessWidget {
  const DateAndTotalSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '07',
          style: AppStyles.textStyle24w400.copyWith(
            fontSize: 26.sp,
          ),
        ),
        SizedBox(width: 5.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'السبت',
              style: AppStyles.textStyle24w400.copyWith(
                color: AppColors.colorGrey,
                fontWeight: FontWeight.bold,
                fontSize: 10.sp,
              ),
            ),
            Text(
              'أكتوبر, 2023',
              style: AppStyles.textStyle24w400.copyWith(
                color: AppColors.colorGrey,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '0.00',
              style: AppStyles.textStyle24w400.copyWith(
                color: Colors.green,
                fontSize: 14.sp,
              ),
            ),
            Text(
              '160.00',
              style: AppStyles.textStyle24w400.copyWith(
                color: Colors.red,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
