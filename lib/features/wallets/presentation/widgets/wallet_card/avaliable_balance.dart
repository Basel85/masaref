import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';

class AvaliableBalance extends StatelessWidget {
  const AvaliableBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(
              text: "53,539.00",
              style: TextStyle(
                color: AppColors.colorWhite,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: " EGP",
              style: TextStyle(
                color: AppColors.colorWhite,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Text("الرصيد المتاح",
                style: TextStyle(fontSize: 16.sp, color: AppColors.colorGrey)),
          ),
        ],
      ),
    );
  }
}
