import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/notification/cubits/add_or_remove_notification/add_or_remove_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/switch_button/switch_button_cubit.dart';
import 'package:masaref/features/notification/cubits/switch_button/switch_button_states.dart';
import 'package:masaref/features/notification/cubits/time/time_cubit.dart';
import 'package:masaref/features/notification/cubits/update_notification/update_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/update_notification/update_notification_states.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateNotificationCubit, UpdateNotificationStates>(
      builder: (_, state) => Switch.adaptive(
        value: UpdateNotificationCubit.get(context).isSwitchedOn,
        onChanged: (isSwitchedOn) {
          UpdateNotificationCubit.get(context)
              .updateNotification(isSwitchedOn: isSwitchedOn);
        },
        activeColor: AppColors.primaryColor,
        splashRadius: 20.r,
      ),
    );
  }
}
