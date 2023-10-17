import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/core/widgets/get_error_message.dart';
import 'package:masaref/features/notification/cubits/get_all_notifications/get_all_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/get_all_notifications/get_all_notification_states.dart';
import 'package:masaref/features/notification/cubits/switch_button/switch_button_cubit.dart';
import 'package:masaref/features/notification/cubits/add_or_remove_notification/add_or_remove_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/add_or_remove_notification/add_or_remove_notification_states.dart';
import 'package:masaref/features/notification/cubits/time/time_cubit.dart';
import 'package:masaref/features/notification/cubits/update_notification/update_notification_cubit.dart';
import 'package:masaref/features/notification/presentation/widgets/notification_time.dart';
import 'package:masaref/features/notification/presentation/widgets/section.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';

class NotificationScreen extends StatelessWidget with SnackBarViewer {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(actions: [
        Text(
          "تنبيهات التطبيق",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
      ]),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<GetAllNotificationCubit, GetAllNotificationStates>(
          builder: (context, state) {
            if (state is GetAllNotificationSuccessState) {
              return ListView(
                children: [
                  Section(
                    sectionName: "التنبيهات العامة",
                    contents: List.generate(
                      state.notifications.length,
                      (index) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => UpdateNotificationCubit()
                              ..setIsSwitchedOn(
                                  state.notifications[index].isSwitchedOn)
                              ..setTime(state.notifications[index].time)
                              ..setId(state.notifications[index].id),
                          ),
                        ],
                        child: const NotificationTime(),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is GetAllNotificationErrorState) {
              return GetErrorMessage(
                  errorMessage: state.errorMessage,
                  onPressed: () {
                    GetAllNotificationCubit.get(context).getAllNotifications();
                  });
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: AppColors.primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
