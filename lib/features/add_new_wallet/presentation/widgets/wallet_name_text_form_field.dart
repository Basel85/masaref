import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      validator: (value) {
        if (value!.isEmpty) {
          return "من فضلك ادخل اسم المحفظة";
        }
        return null;
      },
    );
  }
}
