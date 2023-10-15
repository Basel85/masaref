import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';

class WalletNameTextFormField extends StatelessWidget {
  final TextEditingController nameController;
  const WalletNameTextFormField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      controller: nameController,
      hinttext: "اسم المحفظة",
      hintsize: 14.sp,
      inputStyle: TextStyle(
        color: BlocProvider.of<WholeAppCubit>(context).isdark
            ? AppColors.colorWhite
            : AppColors.colorBlack,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "من فضلك ادخل اسم المحفظة";
        }
        return null;
      },
    );
  }
}
