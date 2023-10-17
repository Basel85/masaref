import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/core/widgets/custom_list_tile.dart';
import 'package:masaref/features/mo3amalat_page/cubits/search/search_cubit.dart';
import 'package:masaref/features/mo3amalat_page/presentation/view/mo3amalat_page.dart';
import 'package:masaref/features/notification/cubits/add_or_remove_notification/add_or_remove_notification_cubit.dart';
import 'package:masaref/features/notification/cubits/get_all_notifications/get_all_notification_cubit.dart';
import 'package:masaref/features/notification/presentation/notification_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WholeAppCubit>(context).getRepeatedTransactions();
    BlocProvider.of<WholeAppCubit>(context).getAllTransactions();
    BlocProvider.of<WholeAppCubit>(context).changePriorityIndex(null);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: Text(
              "المصاريف",
              style: TextStyle(
                color: AppColors.colorWhite,
                fontSize: 20.sp,
              ),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            children: [
              CustomListTile(
                title: "المعاملات المتكررة",
                textColor: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
                icon: Icon(
                  Icons.repeat,
                  color: BlocProvider.of<WholeAppCubit>(context).isdark
                      ? AppColors.colorWhite
                      : AppColors.colorBlack,
                  size: 24.r,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SearchCubit(),
                        child: Mo3amalatPage(
                            transactionList:
                                BlocProvider.of<WholeAppCubit>(context)
                                    .repeatedTransactionlist,
                            categorynamesList:
                                BlocProvider.of<WholeAppCubit>(context)
                                    .repeatedcateNames,
                            isPriorities: false),
                      ),
                    ),
                  );
                },
              ),
              CustomListTile(
                title: "الاولويات",
                textColor: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
                icon: Icon(
                  Icons.priority_high_sharp,
                  color: AppColors.primaryColor,
                  size: 24.r,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => SearchCubit(),
                        child: Mo3amalatPage(
                          transactionList:
                              BlocProvider.of<WholeAppCubit>(context)
                                          .priorityIndex ==
                                      null
                                  ? BlocProvider.of<WholeAppCubit>(context)
                                      .allTransactionlist
                                  : BlocProvider.of<WholeAppCubit>(context)
                                      .priorityTransactionlist,
                          categorynamesList:
                              BlocProvider.of<WholeAppCubit>(context)
                                          .priorityIndex ==
                                      null
                                  ? BlocProvider.of<WholeAppCubit>(context)
                                      .allTransactioncateNames
                                  : BlocProvider.of<WholeAppCubit>(context)
                                      .prioritycateNames,
                          isPriorities: true,
                        ),
                      ),
                    ),
                  );
                },
              ),
              CustomListTile(
                title: "تنبيهات التطبيق",
                textColor: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
                icon: Icon(
                  Icons.notifications_on_sharp,
                  color: AppColors.redColor,
                  size: 24.r,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BlocProvider(
                                create: (context) =>
                                    GetAllNotificationCubit()..getAllNotifications(),
                                child: const NotificationScreen(),
                              )));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
