import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class TopListViewItem extends StatelessWidget {
  const TopListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) => Container(
        width: 110.w,
        decoration: BoxDecoration(
          color: BlocProvider.of<WholeAppCubit>(context).isdark
              ? AppColors.colorBlack
              : AppColors.colorWhite,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.colorWhite.withOpacity(0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'اليوم',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                color: AppColors.colorGrey,
              ),
            ),
            Text(
              '0.00',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 14.sp,
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
