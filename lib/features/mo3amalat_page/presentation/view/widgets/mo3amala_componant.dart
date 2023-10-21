// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/core/data/models/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/data/models/category_model.dart';
import 'package:masaref/features/mo3amala/presentation/view/mo3amala.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_states.dart';

class Mo3amalaComponant extends StatelessWidget {
  const Mo3amalaComponant({
    super.key,
    required this.transactionModel,
    required this.cateName,
    required this.transactionlist,
    required this.isPriorities,
    required this.cateImage,
  });
  final TransactionModel transactionModel;
  final List<TransactionModel> transactionlist;
  final String cateName;
  final String cateImage;
  final bool isPriorities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllWalletsCubit, GetAllWalletsStates>(
      builder: (context, state) {
        return InkWell(
          splashFactory: InkRipple.splashFactory,
          splashColor: AppColors.primaryColor.withOpacity(0.2),
          onTap: () async {
            List<Map> cates = await DBHelper.getAll('Category');
            List<CategoryModel> categorymodels = [];
            for (var element in cates) {
              categorymodels.add(CategoryModel.fromJson(element));
            }
            await Future.delayed(const Duration(milliseconds: 200), () {
              GetAllWalletsCubit.get(context).getAllWallets();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mo3amalaPage(
                    toAdd: false,
                    walletList:
                        state is GetAllWalletsSuccessState ? state.wallets : [],
                    transactionModel: transactionModel,
                    transactionList: transactionlist,
                    categoryList: categorymodels,
                  ),
                ),
              );
            });
          },
          child: Ink(
            padding:
                EdgeInsets.only(right: 5.w, top: 5.h, left: 5.w, bottom: 10.h),
            decoration: BoxDecoration(
              color: BlocProvider.of<WholeAppCubit>(context).isdark
                  ? AppColors.colorBlack
                  : AppColors.colorWhite,
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
                          backgroundImage: cateImage == ''
                              ? null
                              : FileImage(File(cateImage)),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          cateName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color:
                                BlocProvider.of<WholeAppCubit>(context).isdark
                                    ? AppColors.colorWhite
                                    : AppColors.colorBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    if (isPriorities)
                      Icon(
                        transactionModel.priority == '0'
                            ? FontAwesomeIcons.faceSmile
                            : transactionModel.priority == '1'
                                ? FontAwesomeIcons.faceMeh
                                : FontAwesomeIcons.faceMehBlank,
                        color: transactionModel.priority == '0'
                            ? AppColors.primaryColor
                            : transactionModel.priority == '1'
                                ? Colors.amber
                                : AppColors.redColor,
                        size: 30,
                      ),
                    if (!isPriorities)
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
