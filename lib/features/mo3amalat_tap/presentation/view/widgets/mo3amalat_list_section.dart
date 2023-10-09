import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/mo3amalat_list_item.dart';

class Mo3amalatListSection extends StatelessWidget {
  const Mo3amalatListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) => const Mo3amalatListItem(),
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
    );
  }
}
