import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/mo3amalat_by_day_list.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/palance_section.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/top_listview.dart';

class Mo3amalatTap extends StatelessWidget {
  const Mo3amalatTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: AppColors.primaryColor,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const SingleChildScrollView(
                      child: Column(
                        children: [
                          TopListView(),
                          PalanceSection(),
                          Mo3amalatByDayList(),
                        ],
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'الكل',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
