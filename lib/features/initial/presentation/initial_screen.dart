import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            CustomFormField(hinttext: "الرصيد الحالي", hintsize: 14.sp),
            SizedBox(height: 20.h,),
            CustomButton(title: "ابدأ الان", onpress: (){}),
          ],
        )
        )
    );
  }
}