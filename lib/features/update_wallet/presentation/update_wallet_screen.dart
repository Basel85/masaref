import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/core/widgets/add_image.dart';
import 'package:masaref/core/widgets/custom_app_bar.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/core/widgets/price_text_form_field.dart';
import 'package:masaref/core/widgets/wallet_name_text_form_field.dart';
import 'package:masaref/features/update_wallet/cubits/delete_wallet/delete_wallet_cubit.dart';
import 'package:masaref/features/update_wallet/cubits/delete_wallet/delete_wallet_states.dart';
import 'package:masaref/features/update_wallet/cubits/update_wallet/update_wallet_cubit.dart';
import 'package:masaref/features/update_wallet/cubits/update_wallet/update_wallet_states.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';

class UpdateWalletScreen extends StatefulWidget {
  final String name;
  final double balance;
  final int walletId;
  final String imagePath;
  const UpdateWalletScreen(
      {super.key,
      required this.name,
      required this.balance,
      required this.walletId,
      required this.imagePath});

  @override
  State<UpdateWalletScreen> createState() => _UpdateWalletScreenState();
}

class _UpdateWalletScreenState extends State<UpdateWalletScreen>
    with SnackBarViewer {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _nameController.text = widget.name;
    _balanceController.text = widget.balance.toString();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: AppColors.colorWhite,
              size: 30.r,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: AlertDialog.adaptive(
                          title: Text(
                            "حذف",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            "تنبيه!!!\nسوف يتم حذف جميع المعاملات المرتبطة بهذه المحفظة",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "اغلاق",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.colorGrey),
                                )),
                            TextButton(
                                onPressed: () {
                                  DeleteWalletCubit.get(context)
                                      .deleteWallet(id: widget.walletId);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "موافق",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                )),
                          ],
                        ),
                      ));
            },
          ),
          SizedBox(
            width: 16.w,
          )
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: MultiBlocListener(
          listeners: [
            BlocListener<UpdateWalletCubit, UpdateWalletStates>(
              listener: (_, state) {
                if (state is UpdateWalletSuccessState) {
                  showSnackBar(
                      context: context,
                      message: "تم التعديل بنجاح",
                      backgroundColor: Colors.green);
                  GetAllWalletsCubit.get(context).getAllWallets();
                  Navigator.pop(context);
                } else if (state is UpdateWalletErrorState) {
                  showSnackBar(
                      context: context,
                      message: state.errorMessage,
                      backgroundColor: AppColors.redColor);
                }
              },
            ),
            BlocListener<DeleteWalletCubit, DeleteWalletStates>(
              listener: (_, state) {
                if (state is DeleteWalletSuccessState) {
                  showSnackBar(
                      context: context,
                      message: "تم الحذف بنجاح",
                      backgroundColor: Colors.green);
                  GetAllWalletsCubit.get(context).getAllWallets();
                  BlocProvider.of<WholeAppCubit>(context)
                      .getTransactionwithDate();
                  Navigator.pop(context);
                } else if (state is DeleteWalletErrorState) {
                  showSnackBar(
                      context: context,
                      message: state.errorMessage,
                      backgroundColor: AppColors.redColor);
                }
              },
            ),
          ],
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 90.h),
              children: [
                WalletNameTextFormField(
                  nameController: _nameController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                PriceTextFormField(priceController: _balanceController),
                SizedBox(
                  height: 20.h,
                ),
                AddImage(
                  imagePath: widget.imagePath,
                ),
                SizedBox(
                  height: 60.h,
                ),
                CustomButton(
                  title: "تعديل",
                  color: AppColors.redColor,
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      UpdateWalletCubit.get(context).updateWallet(
                          name: _nameController.text,
                          balance: double.parse(_balanceController.text),
                          imagePath: ImagePickerCubit.get(context).imagePath ??
                              widget.imagePath,
                          id: widget.walletId);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
