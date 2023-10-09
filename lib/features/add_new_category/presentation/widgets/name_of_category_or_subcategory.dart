import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';

class NameOfCategoryOrSubCategory extends StatelessWidget {
  const NameOfCategoryOrSubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorWhite,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: AppColors.colorLightBlue,
            child: Icon(
              Icons.edit,
              color: AppColors.colorWhite,
              size: 30.r,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: CustomFormField(
              hinttext: "اسم القسم ",
              hintsize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
