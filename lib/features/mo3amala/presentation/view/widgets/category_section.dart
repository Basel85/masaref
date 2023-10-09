import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: () {},
      child: Ink(
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
            CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.primaryColor,
            ),
            SizedBox(width: 10.w),
            Text(
              'الزكاة',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
