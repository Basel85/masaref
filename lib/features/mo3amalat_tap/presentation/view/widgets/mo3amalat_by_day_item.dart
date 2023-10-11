// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/mo3amalat_page/presentation/view/mo3amalat_page.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/date_total_section.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/mo3amalat_list_section.dart';

class Mo3amalatByDayContainer extends StatelessWidget {
  const Mo3amalatByDayContainer({
    super.key,
    required this.tList,
  });
  final List<TransactionModel> tList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: InkWell(
            splashFactory: InkRipple.splashFactory,
            splashColor: AppColors.primaryColor.withOpacity(0.2),
            onTap: () async {
              await Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Mo3amalatPage(transactionList: tList),
                  ),
                );
              });
            },
            child: Ink(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorBlack
                    : AppColors.colorWhite,
              ),
              child: tList.isEmpty
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : Column(
                      children: [
                        DateAndTotalSection(tList: tList),
                        const Divider(color: AppColors.colorGrey),
                        Mo3amalatListSection(tranList: tList),
                        const Divider(color: AppColors.colorGrey),
                        Text(
                          'المزيد من التفاصيل',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 10.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
