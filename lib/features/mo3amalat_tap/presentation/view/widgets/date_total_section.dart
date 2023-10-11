import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class DateAndTotalSection extends StatelessWidget {
  const DateAndTotalSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              '07',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 26.sp,
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'السبت',
                  style: AppStyles.textStyle24w400.copyWith(
                    color: AppColors.colorGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                  ),
                ),
                Text(
                  'أكتوبر, 2023',
                  style: AppStyles.textStyle24w400.copyWith(
                    color: AppColors.colorGrey,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '0.00',
                  style: AppStyles.textStyle24w400.copyWith(
                    color: Colors.green,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  '160.00',
                  style: AppStyles.textStyle24w400.copyWith(
                    color: Colors.red,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
