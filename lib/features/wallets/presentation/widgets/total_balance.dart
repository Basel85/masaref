import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_state.dart';
import 'package:masaref/core/utils/app_colors.dart';

class TotalBalance extends StatelessWidget {
  final double totalBalance;
  const TotalBalance({super.key, required this.totalBalance});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                ' اجمالي الرصيد',
                style: TextStyle(fontSize: 16.sp, color: AppColors.colorGrey),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "$totalBalance EGP",
              style: TextStyle(
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
