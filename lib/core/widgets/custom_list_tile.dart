import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Color textColor;
  final Widget? trailing;
  final double? imageRadius;
  final Color backgroundColor;
  final String? image;
  final Icon? icon;
  final void Function()? onTap;
  const CustomListTile(
      {super.key,
      required this.title,
      this.textColor = AppColors.colorWhite,
      this.trailing,
      this.imageRadius,
      this.backgroundColor = AppColors.primaryColor,
      this.image, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: image!=null? CircleAvatar(
          radius: imageRadius ?? 20.r,
          backgroundColor: backgroundColor,
          backgroundImage: image!=null && image!=""? FileImage(File(image!)):null,
        ):icon,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
