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
import 'package:masaref/features/categories/data/category_model.dart';
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
    this.categoryList,
  });
  final bool toAdd;
  final TransactionModel? transactionModel;
  final List<TransactionModel> transactionList;
  final List<WalletModel> walletList;
  final List<CategoryModel>? categoryList;

  @override
  State<Mo3amalaPage> createState() => _Mo3amalaPageState();
}

class _Mo3amalaPageState extends State<Mo3amalaPage> with SnackBarViewer {
  @override
  void initState() {
    BlocProvider.of<Mo3amalaCubit>(context).setNotes(null);
    BlocProvider.of<Mo3amalaCubit>(context).setPrice(0);
    BlocProvider.of<Mo3amalaCubit>(context).changeWallet(null);
    BlocProvider.of<Mo3amalaCubit>(context).changeCategory(null);
    BlocProvider.of<Mo3amalaCubit>(context).changeSwitch(false);
    BlocProvider.of<Mo3amalaCubit>(context).importance(0);
    BlocProvider.of<Mo3amalaCubit>(context).chooseDate(DateTime.now());
    BlocProvider.of<Mo3amalaCubit>(context).chooseTime(TimeOfDay.now());

    if (widget.transactionModel != null) {
      BlocProvider.of<Mo3amalaCubit>(context)
          .setNotes(widget.transactionModel!.notes!);
      BlocProvider.of<Mo3amalaCubit>(context)
          .setPrice(widget.transactionModel!.price!);
      BlocProvider.of<Mo3amalaCubit>(context).chooseDate(
        DateTime(
          int.parse(widget.transactionModel!.date!.substring(0, 4)),
          int.parse(widget.transactionModel!.date!.substring(5, 7)),
          int.parse(widget.transactionModel!.date!.substring(8, 10)),
        ),
      );
      BlocProvider.of<Mo3amalaCubit>(context).chooseTime(
        TimeOfDay(
          hour: int.parse(widget.transactionModel!.time!.substring(0, 2)),
          minute: int.parse(widget.transactionModel!.time!.substring(3, 5)),
        ),
      );
      BlocProvider.of<Mo3amalaCubit>(context)
          .importance(int.parse(widget.transactionModel!.priority!));
      BlocProvider.of<Mo3amalaCubit>(context)
          .changeSwitch(bool.parse(widget.transactionModel!.repeat!));
      BlocProvider.of<Mo3amalaCubit>(context).changeWallet(widget.walletList
          .where((wallet) => wallet.id == widget.transactionModel!.walletID)
          .toList()[0]);
      BlocProvider.of<Mo3amalaCubit>(context).changeCategory(widget
          .categoryList!
          .where((cate) => cate.id == widget.transactionModel!.categoryID)
          .toList()[0]);
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
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: AppColors.primaryColor,
                  leading: widget.toAdd
                      ? null
                      : IconButton(
                          onPressed: () async {
                            await deleteTransactioMethod(context);
                          },
                          icon: const Icon(
                            Icons.delete,
                            textDirection: TextDirection.ltr,
                            color: AppColors.colorWhite,
                          ),
                        ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        textDirection: TextDirection.ltr,
                        color: AppColors.colorWhite,
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        MoneySection(
                          cubit: BlocProvider.of<Mo3amalaCubit>(context),
                        ),
                        CategorySection(
                            cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                        Elma7fazaSection(
                            walletList: widget.walletList,
                            cubit: BlocProvider.of<Mo3amalaCubit>(context),
                            toadd: widget.toAdd),
                        DateSection(
                            cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                        RepeatSection(
                            cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                        ImportanceSection(
                            cubit: BlocProvider.of<Mo3amalaCubit>(context)),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: CustomButton(
                            title: widget.toAdd ? 'إضافة معاملة' : 'تعديل',
                            onpress: () async {
                              if (widget.toAdd) {
                                await addTransactionMethod(context);
                              } else {
                                await updateTransactionMethod(context);
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

  Future<void> deleteTransactioMethod(BuildContext context) async {
    await DBHelper.deleteFromAll(widget.transactionModel!.id!, 'Trans_action');
    double balance = BlocProvider.of<Mo3amalaCubit>(context).price!;
    double firstOperand =
        BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.balance;
    double secondOperand =
        (BlocProvider.of<Mo3amalaCubit>(context).pickedCategory!.sectionId == 1
            ? balance
            : -1 * balance);
    UpdateWalletCubit.get(context).updateWallet(
      name: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.name,
      balance: firstOperand + secondOperand,
      imagePath: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.image,
      id: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.id,
    );
    GetAllWalletsCubit.get(context).getAllWallets();
    await BlocProvider.of<WholeAppCubit>(context).getAllTransactions();
    await BlocProvider.of<WholeAppCubit>(context).getTransactionwithDate();
    await BlocProvider.of<WholeAppCubit>(context).getRepeatedTransactions();
    showSnackBar(
      context: context,
      message: 'تم حذف المعاملة',
      backgroundColor: Colors.green,
    );
    Navigator.pop(context);
  }

  Future<void> updateTransactionMethod(BuildContext context) async {
    await DBHelper.updateRecordonTransaction(
      id: widget.transactionModel!.id!,
      price: BlocProvider.of<Mo3amalaCubit>(context).price ??
          widget.transactionModel!.price!,
      sectionid:
          BlocProvider.of<Mo3amalaCubit>(context).pickedCategory!.sectionId,
      categoryid: BlocProvider.of<Mo3amalaCubit>(context).pickedCategory!.id,
      walletid: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.id,
      notes: BlocProvider.of<Mo3amalaCubit>(context).notes ??
          widget.transactionModel!.notes!,
      date: BlocProvider.of<Mo3amalaCubit>(context)
          .transDate
          .toString()
          .substring(0, 10),
      time: BlocProvider.of<Mo3amalaCubit>(context)
          .transTime
          .toString()
          .substring(10, 15),
      repeat: BlocProvider.of<Mo3amalaCubit>(context).repeatChange.toString(),
      priority:
          BlocProvider.of<Mo3amalaCubit>(context).importanceIndex.toString(),
    );
    double balance = BlocProvider.of<Mo3amalaCubit>(context).price ??
        widget.transactionModel!.price!;
    double firstOperand =
        BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.balance;
    double secondOperand = balance;
    double thirdOperand = widget.transactionModel!.price!;
    double finalResult = widget.transactionModel!.sectionID! == 1
        ? firstOperand + (thirdOperand - secondOperand)
        : firstOperand + (secondOperand - thirdOperand);
    UpdateWalletCubit.get(context).updateWallet(
        name: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.name,
        balance: finalResult,
        imagePath: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.image,
        id: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.id);
    GetAllWalletsCubit.get(context).getAllWallets();
    await BlocProvider.of<WholeAppCubit>(context).getAllTransactions();
    await BlocProvider.of<WholeAppCubit>(context).getTransactionwithDate();
    await BlocProvider.of<WholeAppCubit>(context).getRepeatedTransactions();
    showSnackBar(
      context: context,
      message: 'تم تعديل المعاملة',
      backgroundColor: Colors.green,
    );
    Navigator.pop(context);
  }

  Future<void> addTransactionMethod(BuildContext context) async {
    if (BlocProvider.of<Mo3amalaCubit>(context).price == 0 ||
        BlocProvider.of<Mo3amalaCubit>(context).pickedCategory == null ||
        BlocProvider.of<Mo3amalaCubit>(context).pickedWallet == null) {
      showSnackBar(
        context: context,
        message: 'تأكد من اختيار فئة ومحفظة وادخال مبلغ المعاملة',
        backgroundColor: Colors.red,
      );
    } else {
      await DBHelper.insertIntoTransaction(
        price: BlocProvider.of<Mo3amalaCubit>(context).price!,
        sectionid:
            BlocProvider.of<Mo3amalaCubit>(context).pickedCategory!.sectionId,
        categoryid: BlocProvider.of<Mo3amalaCubit>(context).pickedCategory!.id,
        walletid: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet!.id,
        notes: BlocProvider.of<Mo3amalaCubit>(context).notes ?? '',
        date: BlocProvider.of<Mo3amalaCubit>(context)
            .transDate
            .toString()
            .substring(0, 10),
        time: BlocProvider.of<Mo3amalaCubit>(context)
            .transTime
            .toString()
            .substring(10, 15),
        repeat: BlocProvider.of<Mo3amalaCubit>(context).repeatChange.toString(),
        priority: BlocProvider.of<Mo3amalaCubit>(context).importanceIndex,
      );

      double balance = BlocProvider.of<Mo3amalaCubit>(context).price!;
      double firstOperand =
          BlocProvider.of<Mo3amalaCubit>(context).pickedWallet?.balance ??
              widget.walletList[0].balance;
      double secondOperand =
          (BlocProvider.of<Mo3amalaCubit>(context).pickedCategory!.sectionId ==
                  1
              ? -1 * balance
              : balance);
      UpdateWalletCubit.get(context).updateWallet(
        name: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet?.name ??
            widget.walletList[0].name,
        balance: firstOperand + secondOperand,
        imagePath:
            BlocProvider.of<Mo3amalaCubit>(context).pickedWallet?.image ??
                widget.walletList[0].image,
        id: BlocProvider.of<Mo3amalaCubit>(context).pickedWallet?.id ??
            widget.walletList[0].id,
      );
      GetAllWalletsCubit.get(context).getAllWallets();
      await BlocProvider.of<WholeAppCubit>(context).getTransactionwithDate();
      await BlocProvider.of<WholeAppCubit>(context).getRepeatedTransactions();
      await BlocProvider.of<WholeAppCubit>(context).getAllTransactions();
      showSnackBar(
        context: context,
        message: 'تم إضافة المعاملة',
        backgroundColor: Colors.green,
      );
      Navigator.pop(context);
    }
  }
}
