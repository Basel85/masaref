import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';

class ImportanceSection extends StatelessWidget {
  const ImportanceSection({
    super.key,
    required this.cubit,
  });
  final Mo3amalaCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: BlocProvider.of<WholeAppCubit>(context).isdark
            ? AppColors.colorBlack
            : AppColors.colorWhite,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الأولوية',
            style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack),
          ),
          SizedBox(width: 20.w),
          GestureDetector(
            onTap: () {
              cubit.importance(0);
            },
            child: Container(
              height: 55.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: cubit.importanceIndex == 0
                    ? Colors.green
                    : Colors.grey[350],
              ),
              child: Column(
                children: [
                  Text(
                    'أساسى',
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 8.sp,
                      color: cubit.importanceIndex == 0
                          ? AppColors.colorWhite
                          : AppColors.colorBlack,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Icon(
                    FontAwesomeIcons.faceSmile,
                    size: 30,
                    color: cubit.importanceIndex == 0
                        ? AppColors.colorWhite
                        : AppColors.colorBlack,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () {
              cubit.importance(1);
            },
            child: Container(
              height: 55.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: cubit.importanceIndex == 1
                    ? Colors.amber
                    : Colors.grey[350],
              ),
              child: Column(
                children: [
                  Text(
                    'عادى',
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 8.sp,
                      color: cubit.importanceIndex == 1
                          ? AppColors.colorWhite
                          : AppColors.colorBlack,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Icon(
                    FontAwesomeIcons.faceMeh,
                    size: 30,
                    color: cubit.importanceIndex == 1
                        ? AppColors.colorWhite
                        : AppColors.colorBlack,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () {
              cubit.importance(2);
            },
            child: Container(
              height: 55.h,
              width: 50.w,
              decoration: BoxDecoration(
                color:
                    cubit.importanceIndex == 2 ? Colors.red : Colors.grey[350],
              ),
              child: Column(
                children: [
                  Text(
                    'ترفيهى',
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 8.sp,
                      color: cubit.importanceIndex == 2
                          ? AppColors.colorWhite
                          : AppColors.colorBlack,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Icon(
                    FontAwesomeIcons.faceMehBlank,
                    size: 30,
                    color: cubit.importanceIndex == 2
                        ? AppColors.colorWhite
                        : AppColors.colorBlack,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
