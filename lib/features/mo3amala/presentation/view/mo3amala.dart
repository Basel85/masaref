// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/core/helpers/transaction_model.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/features/add_new_wallet/data/models/wallet_model.dart';
import 'package:masaref/features/main/presentation/main_screen.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_state.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/category_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/date_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/elma7faza_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/importance_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/money_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/repeat_section.dart';
import 'package:masaref/features/update_wallet/cubits/update_wallet/update_wallet_cubit.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';

class Mo3amalaPage extends StatefulWidget {
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
  State<Mo3amalaPage> createState() => _Mo3amalaPageState();
}

class _Mo3amalaPageState extends State<Mo3amalaPage> with SnackBarViewer {
  @override
  void initState() {
    if (widget.transactionModel != null) {
      BlocProvider.of<Mo3amalaCubit>(context).pickedWallet = widget.walletList
          .where((wallet) => wallet.id == widget.transactionModel!.walletID)
          .toList()[0];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return BlocConsumer<Mo3amalaCubit, Mo3amalaState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey[350],
                actions: [
                  if (!widget.toAdd)
                    IconButton(
                      onPressed: () {
                        double firstOperand =
                            BlocProvider.of<Mo3amalaCubit>(context)
                                .pickedWallet!
                                .balance;
                        double secondOperand =
                            (widget.transactionModel!.sectionID == 1
                                ? widget.transactionModel!.price!
                                : -1 * widget.transactionModel!.price!);
                        DBHelper.deleteFromAll(
                                widget.transactionModel!.id!, 'Trans_action')
                            .then((value) async {
                          UpdateWalletCubit.get(context).updateWallet(
                              name: BlocProvider.of<Mo3amalaCubit>(context)
                                  .pickedWallet!
                                  .name,
                              balance: firstOperand + secondOperand,
                              imagePath: BlocProvider.of<Mo3amalaCubit>(context)
                                  .pickedWallet!
                                  .image,
                              id: BlocProvider.of<Mo3amalaCubit>(context)
                                  .pickedWallet!
                                  .id);
                          GetAllWalletsCubit.get(context).getAllWallets();
                          await BlocProvider.of<WholeAppCubit>(context)
                              .getTransactionwithDate()
                              .then((value) => showSnackBar(
                                    context: context,
                                    message: 'تم حذف المعاملة',
                                    backgroundColor: Colors.green,
                                  ));
                        });
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MainScreen()),
                            (route) => false);
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
                            walletList: widget.walletList,
                            cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                        SizedBox(height: 10.h),
                        DateSection(
                            cubit: BlocProvider.of<Mo3amalaCubit>(context)),
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
                            title: widget.toAdd ? 'إضافة معاملة' : 'تعديل',
                            onpress: () async {
                              if (widget.toAdd) {
                                if (widget.walletList.isEmpty ||
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
                                    price:
                                        BlocProvider.of<Mo3amalaCubit>(context)
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
                                            widget.walletList[0].id,
                                    notes:
                                        BlocProvider.of<Mo3amalaCubit>(context)
                                                .notes ??
                                            '',
                                    date:
                                        BlocProvider.of<Mo3amalaCubit>(context)
                                            .transDate
                                            .toString()
                                            .substring(0, 10),
                                    time:
                                        BlocProvider.of<Mo3amalaCubit>(context)
                                            .transTime
                                            .toString()
                                            .substring(10, 15),
                                    repeat:
                                        BlocProvider.of<Mo3amalaCubit>(context)
                                            .repeatChange
                                            .toString(),
                                    priority:
                                        BlocProvider.of<Mo3amalaCubit>(context)
                                            .importanceIndex,
                                  );
                                  // print(BlocProvider.of<Mo3amalaCubit>(context)
                                  //     .price);
                                  double balance =
                                      BlocProvider.of<Mo3amalaCubit>(context)
                                              .price ??
                                          0.0;
                                  double firstOperand =
                                      BlocProvider.of<Mo3amalaCubit>(context)
                                              .pickedWallet
                                              ?.balance ??
                                          widget.walletList[0].balance;
                                  double secondOperand =
                                      (BlocProvider.of<Mo3amalaCubit>(context)
                                                  .pickedCategory!
                                                  .sectionId ==
                                              1
                                          ? -1 * balance
                                          : balance);
                                  UpdateWalletCubit.get(context).updateWallet(
                                    name:
                                        BlocProvider.of<Mo3amalaCubit>(context)
                                                .pickedWallet
                                                ?.name ??
                                            widget.walletList[0].name,
                                    balance: firstOperand + secondOperand,
                                    imagePath:
                                        BlocProvider.of<Mo3amalaCubit>(context)
                                                .pickedWallet
                                                ?.image ??
                                            widget.walletList[0].image,
                                    id: BlocProvider.of<Mo3amalaCubit>(context)
                                            .pickedWallet
                                            ?.id ??
                                        widget.walletList[0].id,
                                  );
                                  GetAllWalletsCubit.get(context)
                                      .getAllWallets();
                                  await BlocProvider.of<WholeAppCubit>(context)
                                      .getTransactionwithDate();
                                  List<int> categoryIDs = [];
                                  for (var i = 0;
                                      i < widget.transactionList.length;
                                      i++) {
                                    categoryIDs.add(
                                        widget.transactionList[i].categoryID!);
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
                                  id: widget.transactionModel!.id!,
                                  price: BlocProvider.of<Mo3amalaCubit>(context)
                                          .price ??
                                      widget.transactionModel!.price!,
                                  sectionid:
                                      BlocProvider.of<Mo3amalaCubit>(context)
                                              .pickedCategory
                                              ?.sectionId ??
                                          widget.transactionModel!.sectionID!,
                                  categoryid:
                                      BlocProvider.of<Mo3amalaCubit>(context)
                                              .pickedCategory
                                              ?.id ??
                                          widget.transactionModel!.categoryID!,
                                  walletid:
                                      BlocProvider.of<Mo3amalaCubit>(context)
                                              .pickedWallet
                                              ?.id ??
                                          widget.transactionModel!.walletID!,
                                  notes: BlocProvider.of<Mo3amalaCubit>(context)
                                          .notes ??
                                      widget.transactionModel!.notes!,
                                  date: BlocProvider.of<Mo3amalaCubit>(context)
                                      .transDate
                                      .toString()
                                      .substring(0, 10),
                                  time: BlocProvider.of<Mo3amalaCubit>(context)
                                      .transTime
                                      .toString()
                                      .substring(10, 15),
                                  repeat:
                                      BlocProvider.of<Mo3amalaCubit>(context)
                                          .repeatChange
                                          .toString(),
                                  priority:
                                      BlocProvider.of<Mo3amalaCubit>(context)
                                          .importanceIndex
                                          .toString(),
                                );
                                double balance =
                                    BlocProvider.of<Mo3amalaCubit>(context)
                                            .price ??
                                        widget.transactionModel!.price!;
                                double firstOperand =
                                    BlocProvider.of<Mo3amalaCubit>(context)
                                        .pickedWallet!
                                        .balance;
                                double secondOperand = (BlocProvider.of<
                                                Mo3amalaCubit>(context)
                                            .pickedCategory
                                            ?.sectionId ==
                                        null
                                    ? widget.transactionModel!.sectionID! == 1
                                        ? -1 * balance
                                        : balance
                                    : BlocProvider.of<Mo3amalaCubit>(context)
                                                .pickedCategory
                                                ?.sectionId ==
                                            1
                                        ? -1 * balance
                                        : balance);
                                double thirdOperand = (BlocProvider.of<
                                                Mo3amalaCubit>(context)
                                            .pickedCategory
                                            ?.sectionId ==
                                        null
                                    ? widget.transactionModel!.sectionID! == 1
                                        ? widget.transactionModel!.price!
                                        : -1 * widget.transactionModel!.price!
                                    : BlocProvider.of<Mo3amalaCubit>(context)
                                                .pickedCategory
                                                ?.sectionId ==
                                            1
                                        ? widget.transactionModel!.price!
                                        : -1 * widget.transactionModel!.price!);

                                UpdateWalletCubit.get(context).updateWallet(
                                    name:
                                        BlocProvider.of<Mo3amalaCubit>(context)
                                            .pickedWallet!
                                            .name,
                                    balance: firstOperand +
                                        thirdOperand +
                                        secondOperand,
                                    imagePath:
                                        BlocProvider.of<Mo3amalaCubit>(context)
                                            .pickedWallet!
                                            .image,
                                    id: BlocProvider.of<Mo3amalaCubit>(context)
                                        .pickedWallet!
                                        .id);
                                GetAllWalletsCubit.get(context).getAllWallets();
                                await BlocProvider.of<WholeAppCubit>(context)
                                    .getTransactionwithDate();
                                List<int> categoryIDs = [];
                                for (var i = 0;
                                    i < widget.transactionList.length;
                                    i++) {
                                  categoryIDs.add(
                                      widget.transactionList[i].categoryID!);
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
      },
    );
  }
}
