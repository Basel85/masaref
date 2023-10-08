import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';

class ImportanceSection extends StatelessWidget {
  const ImportanceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        border: Border(
          bottom: BorderSide(
            color: AppColors.colorBlack.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الأولوية',
            style: AppStyles.textStyle24w400.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 20.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 55.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: Colors.grey[350],
              ),
              child: Column(
                children: [
                  Text(
                    'أساسى',
                    style: AppStyles.textStyle24w400.copyWith(fontSize: 8.sp),
                  ),
                  SizedBox(height: 5.h),
                  const Icon(FontAwesomeIcons.faceSmile, size: 30),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 55.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: Colors.grey[350],
              ),
              child: Column(
                children: [
                  Text(
                    'عادى',
                    style: AppStyles.textStyle24w400.copyWith(fontSize: 8.sp),
                  ),
                  SizedBox(height: 5.h),
                  const Icon(FontAwesomeIcons.faceMeh, size: 30),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 55.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: Colors.grey[350],
              ),
              child: Column(
                children: [
                  Text(
                    'ترفيهى',
                    style: AppStyles.textStyle24w400.copyWith(fontSize: 8.sp),
                  ),
                  SizedBox(height: 5.h),
                  const Icon(FontAwesomeIcons.faceMehBlank, size: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}