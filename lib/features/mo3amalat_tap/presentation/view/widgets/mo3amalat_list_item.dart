import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class Mo3amalatListItem extends StatelessWidget {
  const Mo3amalatListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.primaryColor,
            ),
            SizedBox(width: 5.w),
            Text(
              'المواصلات',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 12.sp,
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
            ),
            const Spacer(),
            Text(
              '10.00',
              style: AppStyles.textStyle24w400.copyWith(
                color: Colors.red,
                fontSize: 12.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}
