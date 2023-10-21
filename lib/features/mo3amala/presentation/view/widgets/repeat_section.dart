import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';

class RepeatSection extends StatelessWidget {
  const RepeatSection({
    super.key,
    required this.cubit,
  });

  final Mo3amalaCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
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
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              cubit.switCh();
            },
            child: Row(
              children: [
                Text(
                  'تكرار المعاملة',
                  style: AppStyles.textStyle24w400.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: BlocProvider.of<WholeAppCubit>(context).isdark
                        ? AppColors.colorWhite
                        : AppColors.colorBlack,
                  ),
                ),
                const Spacer(),
                Switch.adaptive(
                  activeColor: AppColors.primaryColor,
                  inactiveTrackColor: AppColors.colorGrey,
                  value: cubit.repeatChange,
                  onChanged: (value) {
                    cubit.switCh();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
