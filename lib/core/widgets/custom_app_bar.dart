import 'package:flutter/material.dart';
import 'package:masaref/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Widget? leading;
  const CustomAppBar(
      {super.key,
      required this.title,
      this.actions,
      this.backgroundColor = AppColors.primaryColor,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: backgroundColor,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
