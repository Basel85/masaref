import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        color: AppColors.colorWhite,
        border: Border(
          bottom: BorderSide(
            color: AppColors.colorBlack.withOpacity(0.5),
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
                  ),
                ),
                SizedBox(width: 10.w),
                const Icon(Icons.arrow_drop_down, size: 30),
                SizedBox(width: 5.w),
                Text(
                  'شهريا',
                  style: AppStyles.textStyle24w400.copyWith(
                    fontSize: 10.sp,
                  ),
                ),
                const Spacer(),
                Switch.adaptive(
                  activeColor: AppColors.primaryColor,
                  value: cubit.repeatChange,
                  onChanged: (value) {
                    cubit.switCh();
                  },
                ),
              ],
            ),
          ),
          // SizedBox(height: 5.h),
          // GestureDetector(
          //   onTap: () {
          //     cubit.sWitCh();
          //   },
          //   child: Row(
          //     children: [
          //       Text(
          //         'التنبيه بالمعاملة',
          //         style: AppStyles.textStyle24w400.copyWith(
          //           fontSize: 10.sp,
          //         ),
          //       ),
          //       const Spacer(),
          //       Switch.adaptive(
          //         activeColor: AppColors.primaryColor,
          //         value: cubit.change,
          //         onChanged: (value) {
          //           cubit.sWitCh();
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
