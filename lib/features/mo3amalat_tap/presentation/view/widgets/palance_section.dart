import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class PalanceSection extends StatelessWidget {
  const PalanceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الرصيد الحالى',
              style: AppStyles.textStyle24w400.copyWith(
                color: AppColors.colorGrey,
                fontSize: 10.sp,
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'EGP '),
                TextSpan(
                  text: '5,840.00',
                  style: AppStyles.textStyle24w400.copyWith(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
