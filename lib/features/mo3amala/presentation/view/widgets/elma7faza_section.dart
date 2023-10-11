import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  });
  final Mo3amalaCubit cubit;
  final List<WalletModel> walletList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        border: Border(
          bottom: BorderSide(
            color: AppColors.colorBlack.withOpacity(0.5),
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
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount:
                                walletList.isEmpty ? 1 : walletList.length,
                            itemBuilder: (context, index) => walletList.isEmpty
                                ? const Center(
                                    child: Text('No Wallets!'),
                                  )
                                : walletList.length == 1
                                    ? BottomSheetListItem(
                                        walletModel: walletList[0],
                                        cubit: cubit)
                                    : BottomSheetListItem(
                                        walletModel: walletList[index],
                                        cubit: cubit),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                          ),
                          CustomButton(
                            title: 'إضافة محفظة',
                            color: Colors.red,
                            onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddNewWalletScreen()));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Ink(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16.r,
                      backgroundColor: AppColors.primaryColor,
                      backgroundImage: cubit.pickedWallet == null
                          ? walletList.isEmpty
                              ? null
                              : FileImage(File(walletList[0].image))
                          : FileImage(File(cubit.pickedWallet!.image)),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.pickedWallet == null
                              ? walletList.isEmpty
                                  ? 'الاسم'
                                  : walletList[0].name
                              : cubit.pickedWallet!.name,
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: cubit.pickedWallet == null
                                    ? walletList.isEmpty
                                        ? 'الرصيد'
                                        : '${walletList[0].balance} '
                                    : '${cubit.pickedWallet!.balance} ',
                                style: AppStyles.textStyle24w400.copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.colorBlack.withOpacity(0.7),
                                ),
                              ),
                              TextSpan(
                                text: 'ج.م',
                                style: AppStyles.textStyle24w400.copyWith(
                                  fontSize: 8.sp,
                                  color: AppColors.colorBlack.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                FontAwesomeIcons.noteSticky,
                size: 35,
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: SizedBox(
                  height: 35.h,
                  child: CustomFormField(
                    inputStyle: AppStyles.textStyle24w400.copyWith(
                      color: AppColors.primaryColor,
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
  });
  final WalletModel walletModel;
  final Mo3amalaCubit cubit;

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
        padding: EdgeInsets.all(10.r),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.primaryColor,
              backgroundImage: FileImage(File(walletModel.image)),
            ),
            SizedBox(width: 10.w),
            Text(
              walletModel.name,
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
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
