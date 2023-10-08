import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/widgets/custom_button.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/category_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/date_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/elma7faza_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/importance_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/money_section.dart';
import 'package:masaref/features/mo3amala/presentation/view/widgets/repeat_section.dart';

class Mo3amalaPage extends StatelessWidget {
  const Mo3amalaPage({super.key, required this.toAdd});
  final bool toAdd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[350],
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              toAdd ? Icons.settings : Icons.delete,
              color: AppColors.colorBlack,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.colorBlack,
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const MoneySection(),
                const CategorySection(),
                const Elma7fazaSection(),
                SizedBox(height: 10.h),
                const DateSection(),
                SizedBox(height: 10.h),
                const RepeatSection(),
                SizedBox(height: 10.h),
                const ImportanceSection(),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomButton(
                    title: toAdd ? 'إضافة معاملة' : 'تعديل',
                    onpress: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
