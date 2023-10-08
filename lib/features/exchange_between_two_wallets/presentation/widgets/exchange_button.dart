import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/widgets/custom_button.dart';

class ExchangeButton extends StatelessWidget {
  const ExchangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: const CustomButton(
        title: "تحويل",
      ),
    );
  }
}
