import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/features/add_new_category/cubits/switch_button/switch_button_cubit.dart';
import 'package:masaref/features/notification/cubits/time/time_cubit.dart';
import 'package:masaref/features/notification/presentation/widgets/notification_time.dart';
import 'package:masaref/features/notification/presentation/widgets/section.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          "تنبيهات التطبيق",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          Section(
            sectionName: "التنبيهات العامة",
            contents: [
              MultiBlocProvider(providers: [
                BlocProvider<SwitchButtonCubit>(
                    create: (context) => SwitchButtonCubit()),
                BlocProvider<TimeCubit>(create: (context) => TimeCubit())
              ], child: const NotificationTime()),
              MultiBlocProvider(providers: [
                BlocProvider<SwitchButtonCubit>(
                    create: (context) => SwitchButtonCubit()),
                BlocProvider<TimeCubit>(create: (context) => TimeCubit())
              ], child: const NotificationTime()),
              MultiBlocProvider(providers: [
                BlocProvider<SwitchButtonCubit>(
                    create: (context) => SwitchButtonCubit()),
                BlocProvider<TimeCubit>(create: (context) => TimeCubit())
              ], child: const NotificationTime()),
              MultiBlocProvider(providers: [
                BlocProvider<SwitchButtonCubit>(
                    create: (context) => SwitchButtonCubit()),
                BlocProvider<TimeCubit>(create: (context) => TimeCubit())
              ], child: const NotificationTime()),
            ],
          ),
        ],
      ),
    );
  }
}
