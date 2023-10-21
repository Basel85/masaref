import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';

class Section extends StatelessWidget {
  final String? sectionName;
  final List<Widget> contents;
  const Section({super.key, this.sectionName, required this.contents});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (sectionName != null)
          Padding(
            padding: EdgeInsets.only(right: 20.0.w),
            child: Text(
              sectionName!,
              style: TextStyle(color: AppColors.colorGrey, fontSize: 16.sp),
            ),
          ),
        Container(
          color: BlocProvider.of<WholeAppCubit>(context).isdark
              ? AppColors.darkMode
              : AppColors.lightMode,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(mainAxisSize: MainAxisSize.min, children: contents),
        )
      ],
    );
  }
}
