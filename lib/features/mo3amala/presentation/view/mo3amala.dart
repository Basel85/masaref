import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/helpers/db_helper.dart';
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

class Mo3amalaPage extends StatelessWidget with SnackBarViewer {
  const Mo3amalaPage({
    super.key,
    required this.toAdd,
    required this.walletList,
  });
  final bool toAdd;
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
                  onPressed: () {},
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
                        onpress: () {
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
                              DBHelper.insertIntoTransaction(
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
                              ).then((value) {
                                BlocProvider.of<WholeAppCubit>(context)
                                    .getTransactionwithDate();
                                showSnackBar(
                                  context: context,
                                  message: 'تم إضافة المعاملة',
                                  backgroundColor: Colors.green,
                                );
                                Navigator.pop(context);
                              });
                            }
                          } else {
                            // DBHelper.updateRecordonTransaction(
                            //   id: id,
                            //   price: price,
                            //   subcategoryid: subcategoryid,
                            //   sectionid: sectionid,
                            //   categoryid: categoryid,
                            //   walletid: walletid,
                            //   notes: notes,
                            //   date: date,
                            //   time: time,
                            //   repeat: repeat,
                            //   priority: priority,
                            // );
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
