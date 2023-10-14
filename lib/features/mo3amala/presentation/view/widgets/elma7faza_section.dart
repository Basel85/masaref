import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';
import 'package:masaref/features/add_new_wallet/data/models/wallet_model.dart';
import 'package:masaref/features/add_new_wallet/presentation/add_new_wallet.dart';
import 'package:masaref/features/mo3amala/presentation/manager/cubit/mo3amala_cubit.dart';

class Elma7fazaSection extends StatelessWidget {
  const Elma7fazaSection({
    super.key,
    required this.walletList,
    required this.cubit,
    required this.toadd,
  });
  final Mo3amalaCubit cubit;
  final List<WalletModel> walletList;
  final bool toadd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: BlocProvider.of<WholeAppCubit>(context).isdark
            ? AppColors.colorBlack
            : AppColors.colorWhite,
        border: const Border(
          bottom: BorderSide(
            color: AppColors.colorGrey,
          ),
        ),
      ),
      child: Column(
        children: [
          Material(
            child: InkWell(
              splashFactory: InkRipple.splashFactory,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  walletList.isEmpty ? 1 : walletList.length,
                              itemBuilder: (context, index) =>
                                  walletList.isEmpty
                                      ? Center(
                                          child: Text('No Wallets!',
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      : walletList.length == 1
                                          ? BottomSheetListItem(
                                              walletModel: walletList[0],
                                              cubit: cubit,
                                              toadd: toadd)
                                          : BottomSheetListItem(
                                              walletModel: walletList[index],
                                              cubit: cubit,
                                              toadd: toadd),
                              // separatorBuilder: (context, index) =>
                              //     const Divider(color: AppColors.colorGrey),
                            ),
                            CustomButton(
                              title: 'إضافة محفظة',
                              color: AppColors.primaryColor,
                              onpress: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AddNewWalletScreen()));
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Ink(
                decoration: BoxDecoration(
                  color: BlocProvider.of<WholeAppCubit>(context).isdark
                      ? AppColors.colorBlack
                      : AppColors.colorWhite,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16.r,
                      backgroundColor: AppColors.primaryColor,
                      backgroundImage: cubit.pickedWallet == null
                          ? null
                          : cubit.pickedWallet?.image == ''
                              ? null
                              : FileImage(File(cubit.pickedWallet!.image)),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.pickedWallet == null
                              ? 'المحفظة'
                              : cubit.pickedWallet!.name,
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color:
                                BlocProvider.of<WholeAppCubit>(context).isdark
                                    ? AppColors.colorWhite
                                    : AppColors.colorBlack,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: cubit.pickedWallet == null
                                    ? 'الرصيد'
                                    : '${cubit.pickedWallet!.balance} ',
                                style: AppStyles.textStyle24w400.copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: BlocProvider.of<WholeAppCubit>(context)
                                          .isdark
                                      ? AppColors.colorWhite
                                      : AppColors.colorBlack,
                                ),
                              ),
                              TextSpan(
                                text: 'ج.م',
                                style: AppStyles.textStyle24w400.copyWith(
                                  fontSize: 8.sp,
                                  color: AppColors.colorGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_drop_down,
                      color: BlocProvider.of<WholeAppCubit>(context).isdark
                          ? AppColors.colorWhite
                          : AppColors.colorBlack,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                FontAwesomeIcons.noteSticky,
                size: 35,
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: SizedBox(
                  height: 35.h,
                  child: CustomFormField(
                    inputStyle: AppStyles.textStyle24w400.copyWith(
                      color: BlocProvider.of<WholeAppCubit>(context).isdark
                          ? AppColors.colorWhite
                          : AppColors.colorBlack,
                      fontSize: 14.sp,
                    ),
                    hinttext: 'الملاحظات',
                    hintsize: 12.sp,
                    onchange: (p0) {
                      cubit.setNotes(p0);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomSheetListItem extends StatelessWidget {
  const BottomSheetListItem({
    super.key,
    required this.walletModel,
    required this.cubit,
    required this.toadd,
  });
  final WalletModel walletModel;
  final Mo3amalaCubit cubit;
  final bool toadd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.green[100],
      splashFactory: InkRipple.splashFactory,
      onTap: () {
        cubit.changeWallet(walletModel);
        Navigator.pop(context);
      },
      child: Ink(
        color: BlocProvider.of<WholeAppCubit>(context).isdark
            ? AppColors.colorBlack
            : AppColors.colorWhite,
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.primaryColor,
              backgroundImage: walletModel.image == ''
                  ? null
                  : FileImage(File(walletModel.image)),
            ),
            SizedBox(width: 10.w),
            Text(
              walletModel.name,
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: BlocProvider.of<WholeAppCubit>(context).isdark
                    ? AppColors.colorWhite
                    : AppColors.colorBlack,
              ),
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${walletModel.balance} ',
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  TextSpan(
                    text: 'ج.م',
                    style: AppStyles.textStyle24w400.copyWith(
                      fontSize: 8.sp,
                      color: AppColors.colorGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
