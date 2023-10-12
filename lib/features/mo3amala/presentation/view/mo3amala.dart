// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/features/add_new_wallet/data/models/wallet_model.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_state.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/category_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/date_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/elma7faza_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/importance_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/money_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/repeat_section.dart';
import 'package:masaref/features/update_wallet/cubits/update_wallet/update_wallet_cubit.dart';

class Mo3amalaPage extends StatelessWidget with SnackBarViewer {
  const Mo3amalaPage({
    super.key,
    required this.toAdd,
    required this.walletList,
    this.transactionModel,
    this.transactionList = const [],
  });
  final bool toAdd;
  final TransactionModel? transactionModel;
  final List<TransactionModel> transactionList;
  final List<WalletModel> walletList;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Mo3amalaCubit, Mo3amalaState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[350],
            actions: [
              if (!toAdd)
                IconButton(
                  onPressed: () {
                    DBHelper.deleteFromAll(
                            transactionModel!.id!, 'Trans_action')
                        .then((value) async {
                      await BlocProvider.of<WholeAppCubit>(context)
                          .getTransactionwithDate()
                          .then((value) => showSnackBar(
                                context: context,
                                message: 'تم حذف المعاملة',
                                backgroundColor: Colors.green,
                              ));
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.colorBlack,
                  ),
                ),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.colorBlack,
              ),
            ),
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    MoneySection(
                        cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                    CategorySection(
                        cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                    Elma7fazaSection(
                        walletList: walletList,
                        cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                    SizedBox(height: 10.h),
                    DateSection(cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                    SizedBox(height: 10.h),
                    RepeatSection(
                        cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                    SizedBox(height: 10.h),
                    ImportanceSection(
                        cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CustomButton(
                        title: toAdd ? 'إضافة معاملة' : 'تعديل',
                        onpress: () async {
                          if (toAdd) {
                            if (walletList.isEmpty ||
                                BlocProvider.of<Mo3amalaCubit>(context)
                                        .pickedCategory ==
                                    null) {
                              showSnackBar(
                                context: context,
                                message: 'تأكد من وجود محفظة واختيار فئة',
                                backgroundColor: Colors.red,
                              );
                            } else {
                              await DBHelper.insertIntoTransaction(
                                price: BlocProvider.of<Mo3amalaCubit>(context)
                                        .price ??
                                    0.0,
                                sectionid:
                                    BlocProvider.of<Mo3amalaCubit>(context)
                                        .pickedCategory!
                                        .sectionId,
                                categoryid:
                                    BlocProvider.of<Mo3amalaCubit>(context)
                                        .pickedCategory!
                                        .id,
                                walletid:
                                    BlocProvider.of<Mo3amalaCubit>(context)
                                            .pickedWallet
                                            ?.id ??
                                        walletList[0].id,
                                notes: BlocProvider.of<Mo3amalaCubit>(context)
                                        .notes ??
                                    '',
                                date: BlocProvider.of<Mo3amalaCubit>(context)
                                    .transDate
                                    .toString()
                                    .substring(0, 10),
                                time: BlocProvider.of<Mo3amalaCubit>(context)
                                    .transTime
                                    .toString()
                                    .substring(10, 15),
                                repeat: BlocProvider.of<Mo3amalaCubit>(context)
                                    .repeatChange
                                    .toString(),
                                priority:
                                    BlocProvider.of<Mo3amalaCubit>(context)
                                        .importanceIndex,
                              );
                              await BlocProvider.of<WholeAppCubit>(context)
                                  .getTransactionwithDate();
                              List<int> categoryIDs = [];
                              for (var i = 0; i < transactionList.length; i++) {
                                categoryIDs.add(transactionList[i].categoryID!);
                              }
                              await BlocProvider.of<WholeAppCubit>(context)
                                  .getCategoryName(categoryIDs);
                              showSnackBar(
                                context: context,
                                message: 'تم إضافة المعاملة',
                                backgroundColor: Colors.green,
                              );
                            }
                          } else {
                            await DBHelper.updateRecordonTransaction(
                              id: transactionModel!.id!,
                              price: BlocProvider.of<Mo3amalaCubit>(context)
                                      .price ??
                                  transactionModel!.price!,
                              sectionid: BlocProvider.of<Mo3amalaCubit>(context)
                                      .pickedCategory
                                      ?.sectionId ??
                                  transactionModel!.sectionID!,
                              categoryid:
                                  BlocProvider.of<Mo3amalaCubit>(context)
                                          .pickedCategory
                                          ?.id ??
                                      transactionModel!.categoryID!,
                              walletid: BlocProvider.of<Mo3amalaCubit>(context)
                                      .pickedWallet
                                      ?.id ??
                                  transactionModel!.walletID!,
                              notes: BlocProvider.of<Mo3amalaCubit>(context)
                                      .notes ??
                                  transactionModel!.notes!,
                              date: BlocProvider.of<Mo3amalaCubit>(context)
                                  .transDate
                                  .toString()
                                  .substring(0, 10),
                              time: BlocProvider.of<Mo3amalaCubit>(context)
                                  .transTime
                                  .toString()
                                  .substring(10, 15),
                              repeat: BlocProvider.of<Mo3amalaCubit>(context)
                                  .repeatChange
                                  .toString(),
                              priority: BlocProvider.of<Mo3amalaCubit>(context)
                                  .importanceIndex
                                  .toString(),
                            );
                            // UpdateWalletCubit.get(context).updateWallet(name: name, balance: balance, imagePath: imagePath, id: id)
                            await BlocProvider.of<WholeAppCubit>(context)
                                .getTransactionwithDate();
                            List<int> categoryIDs = [];
                            for (var i = 0; i < transactionList.length; i++) {
                              categoryIDs.add(transactionList[i].categoryID!);
                            }
                            await BlocProvider.of<WholeAppCubit>(context)
                                .getCategoryName(categoryIDs);
                            showSnackBar( 
                              context: context,
                              message: 'تم تعديل المعاملة',
                              backgroundColor: Colors.green,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
