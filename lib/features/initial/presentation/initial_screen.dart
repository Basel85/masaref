import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/core/widgets/add_image.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';
import 'package:masaref/features/add_new_wallet/cubits/add_new_wallet/add_new_wallet_cubit.dart';
import 'package:masaref/features/add_new_wallet/cubits/add_new_wallet/add_new_wallet_states.dart';
import 'package:masaref/features/main/presentation/main_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> with SnackBarViewer {
  final TextEditingController _totalBalanceController = TextEditingController();
  @override
  void dispose() {
    _totalBalanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: SafeArea(
              child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            Text(
              "اعداد التطبيق للمرة الاولي",
              style: TextStyle(
                  color: AppColors.colorBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            const AddImage(),
            CustomFormField(
              controller: _totalBalanceController,
              hinttext: "الرصيد الحالي",
              hintsize: 14.sp,
              inputType: TextInputType.number,
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocListener<AddNewWalletCubit, AddNewWalletStates>(
              listener: (_, state) {
                if (state is AddNewWalletSuccessState) {
                  showSnackBar(
                      context: context,
                      message: "تم اعداد التطبيق بنجاح",
                      backgroundColor: AppColors.primaryColor);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                    return const MainScreen();
                  }));
                } else if (state is AddNewWalletErrorState) {
                  showSnackBar(
                      context: context,
                      message: state.errorMessage,
                      backgroundColor: AppColors.redColor);
                }
              },
              child: CustomButton(
                  title: "ابدأ الان",
                  onpress: () {
                    AddNewWalletCubit.get(context).addNewWallet(
                        name: "مصروف الشهر",
                        balance: double.parse(_totalBalanceController.text),
                        imagePath:
                            ImagePickerCubit.get(context).imagePath ?? "",
                        color: 0xFFE91E63);
                  }),
            ),
          ],
        ),
      ))),
    );
  }
}
