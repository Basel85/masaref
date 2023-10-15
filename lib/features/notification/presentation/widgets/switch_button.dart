import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/add_new_category/cubits/switch_button/switch_button_cubit.dart';
import 'package:masaref/features/add_new_category/cubits/switch_button/switch_button_states.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchButtonCubit,SwitchButtonStates>(
          builder:(_,state)=> Switch.adaptive(
            value: state is SwitchButtonChangedState
                ? state.value
                : false,
            onChanged: (value) {
              SwitchButtonCubit.get(context).switchButton(value: value);
            },
            activeColor: AppColors.primaryColor,
            splashRadius: 20.r,
          ),
        );
  }
}