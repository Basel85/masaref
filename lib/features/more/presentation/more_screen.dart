import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/core/widgets/custom_list_tile.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "المصاريف",
          style: TextStyle(
            color: AppColors.colorWhite,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          CustomListTile(
            title: "المعاملات المتكررة",
            icon: Icon(
              Icons.repeat,
              color: AppColors.colorBlack,
              size: 24.r,
            ),
            onTap: () {},
          ),
          CustomListTile(
            title: "الاولويات",
            icon: Icon(
              Icons.priority_high_sharp,
              color: AppColors.redColor,
              size: 24.r,
            ),
            onTap: () {},
          ),
          CustomListTile(
            title: "تنبيهات التطبيق",
            icon: Icon(
              Icons.notifications_on_sharp,
              color: AppColors.redColor,
              size: 24.r,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
