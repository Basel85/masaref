import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: BlocProvider.of<WholeAppCubit>(context).isdark
          ? AppColors.colorWhite
          : AppColors.colorBlack,
      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      unselectedLabelColor: BlocProvider.of<WholeAppCubit>(context).isdark
          ? AppColors.colorBlack
          : AppColors.colorWhite,
      unselectedLabelStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      indicatorColor: BlocProvider.of<WholeAppCubit>(context).isdark
          ? AppColors.colorWhite
          : AppColors.colorBlack,
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
