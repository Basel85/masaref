import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_state.dart';
import 'package:masaref/core/data/models/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class DateSection extends StatelessWidget {
  const DateSection({
    super.key,
    required this.tList,
  });
  final List<TransactionModel> tList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              tList[0].date!.substring(8, 10),
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 26.sp,
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tList[0].date!.substring(5, 7),
                  style: AppStyles.textStyle24w400.copyWith(
                    color: AppColors.colorGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                  ),
                ),
                Text(
                  tList[0].date!.substring(0, 4),
                  style: AppStyles.textStyle24w400.copyWith(
                    color: AppColors.colorGrey,
                    fontSize: 10.sp,
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
