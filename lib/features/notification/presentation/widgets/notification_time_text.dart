import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/notification/cubits/time/time_cubit.dart';
import 'package:masaref/features/notification/cubits/time/time_states.dart';
import 'package:masaref/main.dart';

class NotificationTimeText extends StatelessWidget {
  const NotificationTimeText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            TimeCubit.get(navigatorKey.currentContext).changeTime(time!);
          },
          child: BlocBuilder(
            builder:(_,state)=> Text(
              state is TimeChangedState
                  ? state.time.format(context)
                  : TimeCubit.get(context).time.toString(),
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