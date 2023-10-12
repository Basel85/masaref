import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/core/widgets/price_text_form_field.dart';
import 'package:masaref/features/add_new_wallet/cubits/add_new_wallet/add_new_wallet_cubit.dart';
import 'package:masaref/features/add_new_wallet/cubits/add_new_wallet/add_new_wallet_states.dart';
import 'package:masaref/features/add_new_wallet/cubits/check_box/check_box_cubit.dart';
import 'package:masaref/features/add_new_wallet/cubits/check_box/check_box_states.dart';
import 'package:masaref/core/widgets/add_image.dart';
import 'package:masaref/core/widgets/wallet_name_text_form_field.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';

class AddNewWalletScreen extends StatefulWidget {
  const AddNewWalletScreen({super.key});

  @override
  State<AddNewWalletScreen> createState() => _AddNewWalletScreenState();
}

class _AddNewWalletScreenState extends State<AddNewWalletScreen>
    with SnackBarViewer {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _balanceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final Random _random = Random();
  int r = 0;
  int g = 0;
  int b = 0;
  String _hexColor = '';
  @override
  void initState() {
    int r = _random.nextInt(256);
    int g = _random.nextInt(256);
    int b = _random.nextInt(256);

    _hexColor = '${r.toRadixString(16).padLeft(2, '0')}'
        '${g.toRadixString(16).padLeft(2, '0')}'
        '${b.toRadixString(16).padLeft(2, '0')}';
    super.initState();
  }

  String imagePath = "";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
          ),
          body: BlocListener<AddNewWalletCubit, AddNewWalletStates>(
            listener: (context, state) {
              if (state is AddNewWalletSuccessState) {
                showSnackBar(
                    context: context,
                    message: "تم اضافة المحفظة بنجاح",
                    backgroundColor: Colors.green);
                GetAllWalletsCubit.get(context).getAllWallets();
              } else if (state is AddNewWalletErrorState) {
                showSnackBar(
                    context: context,
                    message: state.errorMessage,
                    backgroundColor: Colors.red);
              }
            },
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        child: WalletNameTextFormField(
                          nameController: _nameController,
                        )),
                    SizedBox(
                      height: 16.h,
                    ),
                    PriceTextFormField(
                      priceController: _balanceController,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const AddImage(),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppColors.colorGrey.withOpacity(0.5)),
                          bottom: BorderSide(
                              color: AppColors.colorGrey.withOpacity(0.5)),
                        ),
                      ),
                      child: Row(
                        children: [
                          BlocBuilder<CheckBoxCubit, CheckBoxStates>(
                            builder: (_, state) => Checkbox.adaptive(
                                value: state is CheckBoxChangedState
                                    ? state.isChecked
                                    : false,
                                activeColor: AppColors.colorBlack,
                                onChanged: (isChecked) {
                                  CheckBoxCubit.get(context)
                                      .update(isChecked: isChecked!);
                                }),
                          ),
                          Text("اخفاء الرصيد من الشاشة الرئيسية",
                              style: TextStyle(
                                  fontSize: 16.sp, color: AppColors.colorGrey)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomButton(
                        title: "اضافة محفظة",
                        onpress: () {
                          if (_formKey.currentState!.validate()) {
                            AddNewWalletCubit.get(context).addNewWallet(
                                name: _nameController.text,
                                balance: double.parse(_balanceController.text),
                                imagePath:
                                    ImagePickerCubit.get(context).imagePath ??
                                        "",
                                color: int.parse("0xFF$_hexColor"));
                          }
                        },
                      ),
                    )
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
