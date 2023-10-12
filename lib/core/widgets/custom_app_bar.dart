import 'package:flutter/material.dart';
import 'package:masaref/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double sizeFromHeight;
  final bool? centerTitle;
  const CustomAppBar(
      {super.key,
      this.title,
      this.actions,
      this.backgroundColor = AppColors.primaryColor,
      this.leading,
      this.bottom,
      this.sizeFromHeight = kToolbarHeight, this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
centerTitle: centerTitle,
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
