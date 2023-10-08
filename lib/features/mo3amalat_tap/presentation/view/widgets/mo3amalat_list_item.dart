import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class Mo3amalatListItem extends StatelessWidget {
  const Mo3amalatListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15.r,
          backgroundColor: AppColors.primaryColor,
        ),
        SizedBox(width: 5.w),
        Text(
          'المواصلات',
          style: AppStyles.textStyle24w400.copyWith(
            fontSize: 12.sp,
          ),
        ),
        const Spacer(),
        Text(
          '10.00',
          style: AppStyles.textStyle24w400.copyWith(
            color: Colors.red,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

