import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.colorBlack.withOpacity(0.05),
        hintText: 'بحث',
        hintStyle: TextStyle(
          color: AppColors.colorBlack.withOpacity(0.5),
          fontSize: 12.sp,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    );
  }
}