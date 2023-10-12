import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الرصيد الحالى',
                  style: AppStyles.textStyle24w400.copyWith(
                    color: AppColors.colorGrey,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'EGP ',
                      style: TextStyle(
                        color: AppColors.colorGrey,
                      ),
                    ),
                    TextSpan(
                      text: '5,840.00',
                      style: AppStyles.textStyle24w400.copyWith(
                        color: BlocProvider.of<WholeAppCubit>(context).isdark
                            ? AppColors.colorWhite
                            : AppColors.colorBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
