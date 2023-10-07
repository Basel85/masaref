import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';

class Mo3amalaComponant extends StatelessWidget {
  const Mo3amalaComponant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding:
            EdgeInsets.only(right: 10.w, top: 10.h, left: 10.w, bottom: 15.h),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '07/10/2023 03:54 PM',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: AppColors.primaryColor,
                ),
                SizedBox(width: 3.w),
                Text(
                  'المواصلات',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
              child: const Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'الأجرة',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10.r,
                          backgroundColor: AppColors.primaryColor,
                        ),
                        SizedBox(width: 5.w),
                        SizedBox(
                          width: 60.w,
                          child: Text(
                            'مصروف الشهر',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.colorBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '150.00 ',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text: 'ج.م',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
