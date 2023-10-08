import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';
import 'package:masaref/core/widgets/price_text_form_field.dart';
import 'package:masaref/features/add_new_wallet/cubits/check_box/check_box_cubit.dart';
import 'package:masaref/features/add_new_wallet/cubits/check_box/check_box_states.dart';

class AddNewWalletScreen extends StatelessWidget {
  const AddNewWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorGrey,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 90.h),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: CustomFormField(
                hinttext: "اسم المحفظة",
                hintsize: 14.sp,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const PriceTextFormField(),
            SizedBox(
              height: 16.h,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20.r,
              ),
              title: const Text(
                "نقدي",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.colorGrey.withOpacity(0.5)),
                  bottom:
                      BorderSide(color: AppColors.colorGrey.withOpacity(0.5)),
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
              child: const CustomButton(
                title: "اضافة محفظة",
              ),
            )
          ],
        ),
      ),
    );
  }
}
