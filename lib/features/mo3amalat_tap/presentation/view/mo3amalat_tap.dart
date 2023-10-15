import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/mo3amalat_by_day_list.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/palance_section.dart';

class Mo3amalatTap extends StatefulWidget {
  const Mo3amalatTap({super.key});

  @override
  State<Mo3amalatTap> createState() => _Mo3amalatTapState();
}

class _Mo3amalatTapState extends State<Mo3amalatTap> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WholeAppCubit>(context)
        .getTransactionwithDate()
        .then((value) {});
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'مصاريف',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<WholeAppCubit>(context).changeAppTheme();
                  },
                  icon: BlocProvider.of<WholeAppCubit>(context).isdark
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode),
                ),
              ],
            ),
            body: BlocProvider.of<WholeAppCubit>(context)
                        .transactionDate1list
                        .isEmpty &&
                    BlocProvider.of<WholeAppCubit>(context)
                        .transactionDate2list
                        .isEmpty &&
                    BlocProvider.of<WholeAppCubit>(context)
                        .transactionDate3list
                        .isEmpty &&
                    BlocProvider.of<WholeAppCubit>(context)
                        .transactionDate4list
                        .isEmpty &&
                    BlocProvider.of<WholeAppCubit>(context)
                        .transactionDate5list
                        .isEmpty &&
                    BlocProvider.of<WholeAppCubit>(context)
                        .transactionDate6list
                        .isEmpty &&
                    BlocProvider.of<WholeAppCubit>(context)
                        .transactionDate7list
                        .isEmpty
                ? Center(
                    child: Text(
                    'لا معاملات للان',
                    style: AppStyles.textStyle14PrimaryColor,
                  ))
                : Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    child: const ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: AppColors.primaryColor,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              BalanceSection(),
                              Mo3amalatByDayList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
