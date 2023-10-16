import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/notification/cubits/add_or_remove_notification/add_or_remove_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/switch_button/switch_button_cubit.dart';
import 'package:masaref/features/notification/cubits/time/time_cubit.dart';
import 'package:masaref/features/notification/cubits/time/time_states.dart';

class NotificationTimeText extends StatefulWidget {
  final int id;
  const NotificationTimeText({super.key, required this.id});

  @override
  State<NotificationTimeText> createState() => _NotificationTimeTextState();
}

class _NotificationTimeTextState extends State<NotificationTimeText> {
  void _changeTime(TimeOfDay? time) {
    TimeCubit.get(context).changeTime(time!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeCubit.get(context).time,
        );
        _changeTime(time);
      },
      child: BlocConsumer<TimeCubit, TimeStates>(
        listener: (_, state) {
          // AddOrRemoveNotificationCubit.get(context).addOrRemoveNotification(
          //   isSwitchedOn: SwitchButtonCubit.get(context).isSwitchedOn,
          //   id: widget.id
          // );
        },
        builder: (_, state) => Text(
          state is TimeChangedState
              ? state.time.format(context)
              : DateFormat('a hh:mm').format(DateTime(
                  2023,
                  1,
                  1,
                  TimeCubit.get(context).time.hour,
                  TimeCubit.get(context).time.minute)),
          style: TextStyle(
            color: AppColors.colorBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
