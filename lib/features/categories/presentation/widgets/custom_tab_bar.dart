import 'package:flutter/material.dart';
import 'package:masaref/core/utils/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.colorBlack.withOpacity(0.5),
      indicatorColor: AppColors.primaryColor,
      tabs: const [
        Tab(
          text: 'المصروف',
        ),
        Tab(
          text: 'الدخل',
        ),
      ],
    );
  }
}
