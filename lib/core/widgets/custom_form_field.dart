import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.controller,
    this.inputType,
    this.obscuretext = false,
    required this.hinttext,
    this.prefixicon,
    this.validator,
    this.initvalue,
    this.readonly = false,
    this.autofocus = false,
    this.label,
    this.onchange,
    this.enabled,
    this.suffixicon,
    this.ontap,
    this.onsubmit,
    required this.hintsize,
  });

  final TextEditingController? controller;
  final TextInputType? inputType;
  final double hintsize;
  final bool obscuretext;
  final bool readonly;
  final bool autofocus;
  final bool? enabled;
  final String hinttext;
  final String? label;
  final String? initvalue;
  final Icon? prefixicon;
  final Icon? suffixicon;
  final String? Function(String?)? validator;
  final Function(String)? onchange;
  final Function()? ontap;
  final Function(String)? onsubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initvalue,
      autofocus: autofocus,
      readOnly: readonly,
      obscureText: obscuretext,
      enabled: enabled,
      keyboardType: inputType,
      onChanged: onchange,
      onTap: ontap,
      onFieldSubmitted: onsubmit,
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        prefixIcon: prefixicon,
        hintStyle: AppStyles.textStyle24w400.copyWith(
          fontSize: 16.sp,
          color: AppColors.colorBlack.withOpacity(0.2),
        ),
        labelStyle: AppStyles.textStyle24w400.copyWith(
          fontSize: 14.sp,
        ),
        labelText: label,
        hintText: hinttext,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
