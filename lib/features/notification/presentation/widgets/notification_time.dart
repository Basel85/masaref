import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/features/notification/cubits/update_notification/update_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/update_notification/update_notification_states.dart';
import 'package:masaref/features/notification/presentation/widgets/notification_time_text.dart';
import 'package:masaref/features/notification/presentation/widgets/switch_button.dart';

class NotificationTime extends StatelessWidget with SnackBarViewer {
  const NotificationTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateNotificationCubit, UpdateNotificationStates>(
      listener: (context, state) {
        if (state is UpdateNotificationSuccessState) {
          showSnackBar(
              context: context,
              message: "تم تعديل التنبيه بنجاح",
              backgroundColor: AppColors.primaryColor);
        } else if (state is UpdateNotificationErrorState) {
          showSnackBar(
              context: context,
              message: state.errorMessage,
              backgroundColor: AppColors.redColor);
        }
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [NotificationTimeText(), SwitchButton()],
      ),
    );
  }
}
