import 'package:flutter/material.dart';
import 'package:masaref/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double sizeFromHeight;
  const CustomAppBar(
      {super.key,
      required this.title,
      this.actions,
      this.backgroundColor = AppColors.primaryColor,
      this.leading,
      this.bottom,
      this.sizeFromHeight = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      surfaceTintColor: backgroundColor,
      leading: leading,
      backgroundColor: backgroundColor,
      title: title,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(sizeFromHeight);
}
