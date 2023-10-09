import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/mo3amalat_by_day_item.dart';

class Mo3amalatByDayList extends StatelessWidget {
  const Mo3amalatByDayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) => const Mo3amalatByDayContainer(),
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
    );
  }
}
