import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Color textColor;
  final Widget? trailing;
  const CustomListTile(
      {super.key,
      required this.title,
      this.textColor = AppColors.colorWhite,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20.r,
        backgroundColor: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: trailing,
    );
  }
}
