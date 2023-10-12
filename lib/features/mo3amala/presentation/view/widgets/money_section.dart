import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';

class MoneySection extends StatelessWidget {
  const MoneySection({
    super.key,
    required this.cubit,
  });
  final Mo3amalaCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.w),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 35.h,
                width: 40.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'ج.م',
                    style: AppStyles.textStyle24w400.copyWith(
                        fontSize: 10.sp,
                        color: BlocProvider.of<WholeAppCubit>(context).isdark
                            ? AppColors.colorWhite
                            : AppColors.colorBlack),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: SizedBox(
                  height: 45.h,
                  child: CustomFormField(
                    inputStyle: AppStyles.textStyle24w400.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 20.sp,
                    ),
                    inputType: TextInputType.number,
                    hinttext: 'المبلغ',
                    hintsize: 16.sp,
                    onchange: (p0) {
                      if (p0.isNotEmpty) {
                        cubit.setPrice(double.parse(p0));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
