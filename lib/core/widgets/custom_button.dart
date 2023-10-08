import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onpress,
  });
  final String title;
  final Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: TextButton(
        onPressed: onpress,
        child: Center(
          child: Text(
            title,
            style: AppStyles.textStyle24w400.copyWith(
              color: AppColors.colorWhite,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
