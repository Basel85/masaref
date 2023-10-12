import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/categories/presentation/categories_screen.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.cubit,
  });
  final Mo3amalaCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CategoriesScreen()));
      },
      child: Ink(
        padding: EdgeInsets.all(15.r),
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
        child: Row(
          children: [
            CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.primaryColor,
              // backgroundImage: cubit.pickedCategory?.image == null
              //     ? null
              //     : cubit.pickedCategory!.image,
            ),
            SizedBox(width: 10.w),
            Text(
              cubit.pickedCategory?.name ?? 'الفئة',
              style: AppStyles.textStyle24w400.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: BlocProvider.of<WholeAppCubit>(context).isdark
                      ? AppColors.colorWhite
                      : AppColors.colorBlack),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_drop_down,
              color: BlocProvider.of<WholeAppCubit>(context).isdark
                  ? AppColors.colorWhite
                  : AppColors.colorBlack,
            ),
          ],
        ),
      ),
    );
  }
}
