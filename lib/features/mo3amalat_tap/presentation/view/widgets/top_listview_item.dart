import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class TopListViewItem extends StatelessWidget {
  const TopListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      splashColor: AppColors.primaryColor.withOpacity(0.2),
      onTap: () async {
        // await Future.delayed(const Duration(milliseconds: 600));
      },
      child: Ink(
        width: 110.w,
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.colorBlack.withOpacity(0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'اليوم',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                color: AppColors.colorBlack.withOpacity(0.5),
              ),
            ),
            Text(
              '0.00',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 14.sp,
                color: AppColors.colorBlack.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
