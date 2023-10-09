import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';

class AddNewCategorySwitch extends StatelessWidget {
  const AddNewCategorySwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.colorWhite,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("اضافة قسم رئيسي", style: TextStyle(
            color: AppColors.colorBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),),
          Switch.adaptive(
            value: true,
            onChanged: (value) {},
            activeTrackColor: AppColors.primaryColor,
            activeColor: AppColors.colorWhite,
          ),
        ],
       ),
    );
  }
}