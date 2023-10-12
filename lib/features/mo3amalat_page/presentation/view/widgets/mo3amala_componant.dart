// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/mo3amala/presentation/view/mo3amala.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_states.dart';

class Mo3amalaComponant extends StatelessWidget {
  const Mo3amalaComponant({
    super.key,
    required this.transactionModel,
    required this.cateName, required this.transactionlist,
  });
  final TransactionModel transactionModel;
  final List<TransactionModel> transactionlist;
  final String? cateName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllWalletsCubit, GetAllWalletsStates>(
      builder: (context, state) {
        return InkWell(
          splashFactory: InkRipple.splashFactory,
          splashColor: AppColors.primaryColor.withOpacity(0.2),
          onTap: () async {
            await Future.delayed(const Duration(milliseconds: 200), () {
              GetAllWalletsCubit.get(context).getAllWallets();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mo3amalaPage(
                    toAdd: false,
                    walletList:
                        state is GetAllWalletsSuccessState ? state.wallets : [],
                    transactionModel: transactionModel, transactionList: transactionlist,
                  ),
                ),
              );
            });
          },
          child: Ink(
            padding:
                EdgeInsets.only(right: 5.w, top: 5.h, left: 5.w, bottom: 10.h),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${transactionModel.date}  ${transactionModel.time}',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                  child: const Divider(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16.r,
                          backgroundColor: AppColors.primaryColor,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          cateName??"",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.colorBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: transactionModel.price.toString(),
                            style: transactionModel.sectionID == 1
                                ? const TextStyle(
                                    color: Colors.red,
                                  )
                                : const TextStyle(
                                    color: Colors.green,
                                  ),
                          ),
                          const TextSpan(
                            text: ' ج.م',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
