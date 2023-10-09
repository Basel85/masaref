import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_list_tile.dart';

class MainCategory extends StatelessWidget {
  const MainCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      color: AppColors.colorWhite,
      child: CustomListTile(
        imageRadius: 25.r,
        title: 'القسم الرئيسي',
        textColor: AppColors.colorGrey,
        backgroundColor: AppColors.colorGrey,
      ),
    );
  }
}
