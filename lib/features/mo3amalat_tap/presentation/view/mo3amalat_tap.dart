import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
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
            child: const ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: AppColors.primaryColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TopListView(),
                      PalanceSection(),
                      Mo3amalatByDayList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
