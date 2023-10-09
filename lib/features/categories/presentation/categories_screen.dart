import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/features/categories/presentation/widgets/custom_tab_bar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
            sizeFromHeight: 100.h,
            backgroundColor: AppColors.colorGrey,
            title: Text(
              'الاقسام',
              style: TextStyle(
                  color: AppColors.colorBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0), child: CustomTabBar())),
        body: const DefaultTabController(
          length: 3,
          child: TabBarView(
            children: [
              Text("dddd"),
              Text("dddd"),
              Text("dddd"),
            ],
          ),
        ),
      ),
    );
  }
}
