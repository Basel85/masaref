// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';

class DateSection extends StatelessWidget {
  const DateSection({
    super.key,
    required this.cubit,
  });
  final Mo3amalaCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: BlocProvider.of<WholeAppCubit>(context).isdark
            ? AppColors.colorBlack
            : AppColors.colorWhite,
        border: const Border(
          bottom: BorderSide(
            color: AppColors.colorGrey,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () async {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2050),
          );
          BlocProvider.of<Mo3amalaCubit>(context).chooseDate(date);
        },
        child: Row(
          children: [
            Icon(
              Icons.calendar_month_outlined,
              color: BlocProvider.of<WholeAppCubit>(context).isdark
                  ? AppColors.colorWhite
                  : AppColors.colorBlack,
            ),
            SizedBox(width: 10.w),
            Text(
              'تاريخ المعاملة',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              BlocProvider.of<Mo3amalaCubit>(context)
                  .transDate
                  .toString()
                  .substring(0, 10),
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                color: AppColors.colorGrey,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                TimeOfDay? time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                BlocProvider.of<Mo3amalaCubit>(context).chooseTime(time);
              },
              child: Container(
                padding: EdgeInsets.only(right: 10.w),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: AppColors.colorGrey,
                    ),
                  ),
                ),
                child: Text(
                  BlocProvider.of<Mo3amalaCubit>(context)
                      .transTime
                      .toString()
                      .substring(10, 15),
                  textDirection: TextDirection.ltr,
                  style: AppStyles.textStyle24w400.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.colorGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
