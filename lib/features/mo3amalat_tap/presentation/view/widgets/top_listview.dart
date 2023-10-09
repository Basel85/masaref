import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/widgets/top_listview_item.dart';

class TopListView extends StatelessWidget {
  const TopListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) => const TopListViewItem(),
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
      ),
    );
  }
}
