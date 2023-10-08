import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class DateSection extends StatelessWidget {
  const DateSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          border: Border(
            bottom: BorderSide(
              color: AppColors.colorBlack.withOpacity(0.5),
            ),
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month_outlined),
            SizedBox(width: 10.w),
            Text(
              'تاريخ المعاملة',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              '07/10/2023',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                color: AppColors.colorBlack.withOpacity(0.6),
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: AppColors.colorBlack.withOpacity(0.4),
                  ),
                ),
              ),
              child: Text(
                '04:03 PM',
                textDirection: TextDirection.ltr,
                style: AppStyles.textStyle24w400.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.colorBlack.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
