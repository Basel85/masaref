import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: BlocProvider.of<WholeAppCubit>(context).isdark
            ? AppColors.colorWhite
            : AppColors.colorBlack,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorBlack.withOpacity(0.05),
        hintText: 'بحث',
        hintStyle: TextStyle(
          color: BlocProvider.of<WholeAppCubit>(context).isdark
              ? AppColors.colorWhite
              : AppColors.colorBlack,
          fontSize: 12.sp,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: BlocProvider.of<WholeAppCubit>(context).isdark
              ? AppColors.colorWhite
              : AppColors.colorBlack,
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
