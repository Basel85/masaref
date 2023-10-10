// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/mo3amala/presentation/view/mo3amala.dart';

class Mo3amalaComponant extends StatelessWidget {
  const Mo3amalaComponant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      splashColor: AppColors.primaryColor.withOpacity(0.2),
      onTap: () async {
        await Future.delayed(const Duration(milliseconds: 200), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Mo3amalaPage(toAdd: false),
            ),
          );
        });
      },
      child: Ink(
        padding: EdgeInsets.only(right: 5.w, top: 5.h, left: 5.w, bottom: 10.h),
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
                fontSize: 10.sp,
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
                    fontSize: 10.sp,
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 16.r,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'الأجرة',
                      style: TextStyle(
                        fontSize: 10.sp,
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
