import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/notification/cubits/add_or_remove_notification/add_or_remove_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/switch_button/switch_button_cubit.dart';
import 'package:masaref/features/notification/cubits/switch_button/switch_button_states.dart';

class SwitchButton extends StatelessWidget {
  final int id;
  const SwitchButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwitchButtonCubit, SwitchButtonStates>(
      listener: (_, state) {
        AddOrRemoveNotificationCubit.get(context).addOrRemoveNotification(
            isSwitchedOn: SwitchButtonCubit.get(context).isSwitchedOn,id: id);

      },
      builder: (_, state) => Switch.adaptive(
        value: state is SwitchButtonChangedState ? state.value : false,
        onChanged: (value) {
          SwitchButtonCubit.get(context).switchButton(value: value);
        },
        activeColor: AppColors.primaryColor,
        splashRadius: 20.r,
      ),
    );
  }
}
