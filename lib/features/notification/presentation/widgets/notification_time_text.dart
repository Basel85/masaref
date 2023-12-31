import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/notification/cubits/update_notification/update_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/update_notification/update_notification_states.dart';

class NotificationTimeText extends StatefulWidget {
  const NotificationTimeText({super.key});

  @override
  State<NotificationTimeText> createState() => _NotificationTimeTextState();
}

class _NotificationTimeTextState extends State<NotificationTimeText> {
  void _changeTime(TimeOfDay? time) {
    UpdateNotificationCubit.get(context).updateNotification(newTime: time);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: UpdateNotificationCubit.get(context).time,
        );
        _changeTime(time);
      },
      child: BlocBuilder<UpdateNotificationCubit, UpdateNotificationStates>(
        builder: (_, state) => Text(
          "${UpdateNotificationCubit.get(context).time.hourOfPeriod < 9 ? "0${UpdateNotificationCubit.get(context).time.hourOfPeriod}" : "${UpdateNotificationCubit.get(context).time.hourOfPeriod}"} : ${UpdateNotificationCubit.get(context).time.minute < 9 ? "0${UpdateNotificationCubit.get(context).time.minute}" : UpdateNotificationCubit.get(context).time.minute} ${UpdateNotificationCubit.get(context).time.hour >= 12 ? "PM" : "AM"}",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: BlocProvider.of<WholeAppCubit>(context).isdark
                ? AppColors.colorWhite
                : AppColors.colorBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
