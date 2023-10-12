import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';

class OnBoardingButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  const OnBoardingButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.colorWhite)),
            child: Text(
              buttonText,
              style: const TextStyle(color: AppColors.colorWhite),
            )));
  }
}
