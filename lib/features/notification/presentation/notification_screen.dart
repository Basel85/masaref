import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/features/notification/cubits/switch_button/switch_button_cubit.dart';
import 'package:masaref/features/notification/cubits/add_or_remove_notification/add_or_remove_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/add_or_remove_notification/add_or_remove_notification_states.dart';
import 'package:masaref/features/notification/cubits/time/time_cubit.dart';
import 'package:masaref/features/notification/presentation/widgets/notification_time.dart';
import 'package:masaref/features/notification/presentation/widgets/section.dart';

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
        child: BlocListener<AddOrRemoveNotificationCubit,
            AddOrRemoveNotificationStates>(
          listener: (_, state) {
            if (state is AddOrRemoveNotificationSuccessState) {
              showSnackBar(
                  context: context,
                  message: "تم تعديل التنبيه",
                  backgroundColor: AppColors.primaryColor);
            } else if (state is AddOrRemoveNotificationErrorState) {
              showSnackBar(
                  context: context,
                  message: state.errorMessage,
                  backgroundColor: AppColors.redColor);
            }
          },
          child: ListView(
            children: [
              Section(
                sectionName: "التنبيهات العامة",
                contents: [
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => TimeCubit(),
                      ),
                      BlocProvider(
                        create: (context) => SwitchButtonCubit(),
                      ),
                    ],
                    child: const NotificationTime(id: 0,),
                  ),
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => TimeCubit(),
                      ),
                      BlocProvider(
                        create: (context) => SwitchButtonCubit(),
                      ),
                    ],
                    child: const NotificationTime(id: 1,),
                  ),
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => TimeCubit(),
                      ),
                      BlocProvider(
                        create: (context) => SwitchButtonCubit(),
                      ),
                    ],
                    child: const NotificationTime(id: 2,),
                  ),
                  MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => TimeCubit(),
                      ),
                      BlocProvider(
                        create: (context) => SwitchButtonCubit(),
                      ),
                    ],
                    child: const NotificationTime(id: 3,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
