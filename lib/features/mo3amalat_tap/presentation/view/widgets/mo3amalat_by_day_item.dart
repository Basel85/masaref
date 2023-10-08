import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/date_total_section.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/mo3amalat_list_section.dart';

class Mo3amalatByDayContainer extends StatelessWidget {
  const Mo3amalatByDayContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5.r),
        decoration: const BoxDecoration(
          color: AppColors.colorWhite,
        ),
        child: Column(
          children: [
            const DateAndTotalSection(),
            const Divider(color: AppColors.colorGrey),
            const Mo3amalatListSection(),
            const Divider(color: AppColors.colorGrey),
            Text(
              'المزيد من التفاصيل',
              style: AppStyles.textStyle24w400.copyWith(
                fontSize: 10.sp,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
