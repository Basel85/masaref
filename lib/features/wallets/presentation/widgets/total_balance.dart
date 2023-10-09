import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            ' اجمالي الرصيد',
            style: TextStyle(fontSize: 16.sp, color: AppColors.colorGrey),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "114,464.00 EGP",
          style: TextStyle(
            color: AppColors.colorBlack,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
