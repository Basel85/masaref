import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class DateAndTotalSection extends StatefulWidget {
  const DateAndTotalSection({
    super.key,
    required this.tList,
  });
  final List<TransactionModel> tList;

  @override
  State<DateAndTotalSection> createState() => _DateAndTotalSectionState();
}

class _DateAndTotalSectionState extends State<DateAndTotalSection> {
  @override
  void initState() {
    for (var element in widget.tList) {
      BlocProvider.of<WholeAppCubit>(context).getByDayTotal(element);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              widget.tList[0].date!.substring(8, 10),
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
                  widget.tList[0].date!.substring(5, 7),
                  style: AppStyles.textStyle24w400.copyWith(
                    color: AppColors.colorGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                  ),
                ),
                Text(
                  widget.tList[0].date!.substring(0, 4),
                  style: AppStyles.textStyle24w400.copyWith(
                    color: AppColors.colorGrey,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              BlocProvider.of<WholeAppCubit>(context).byDayTotal < 0
                  ? BlocProvider.of<WholeAppCubit>(context)
                      .byDayTotal
                      .toString()
                      .split('-')[1]
                  : BlocProvider.of<WholeAppCubit>(context)
                      .byDayTotal
                      .toString(),
              style: AppStyles.textStyle24w400.copyWith(
                color: BlocProvider.of<WholeAppCubit>(context).byDayTotal < 0
                    ? Colors.red
                    : Colors.green,
                fontSize: 14.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}
