import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/core/widgets/custom_list_tile.dart';
import 'package:masaref/features/mo3amalat_page/presentation/view/mo3amalat_page.dart';

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
                      builder: (context) => Mo3amalatPage(
                          transactionList:
                              BlocProvider.of<WholeAppCubit>(context)
                                  .repeatedTransactionlist,
                          categorynamesList:
                              BlocProvider.of<WholeAppCubit>(context)
                                  .repeatedcateNames),
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
                onTap: () {},
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
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
