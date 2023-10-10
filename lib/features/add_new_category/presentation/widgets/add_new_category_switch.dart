import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/add_new_category/cubits/switch_button/switch_button_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/switch_button/switch_button_states.dart';

class AddNewCategorySwitch extends StatelessWidget {
  const AddNewCategorySwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.colorWhite,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("اضافة قسم رئيسي", style: TextStyle(
            color: AppColors.colorBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),),
          BlocBuilder<SwitchButtonCubit,SwitchButtonStates>(
            builder:(_,state)=> Switch.adaptive(
              value: state is SwitchButtonChangedState? state.value: false,
              onChanged: (value) {
                SwitchButtonCubit.get(context).switchButton(value: value);
              },
              activeTrackColor: AppColors.primaryColor,
              activeColor: AppColors.colorWhite,
            ),
          ),
        ],
       ),
    );
  }
}