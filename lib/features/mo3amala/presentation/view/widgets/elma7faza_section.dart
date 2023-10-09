import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/app_styles.dart';
import 'package:masaref/core/widgets/custom_form_field.dart';

class Elma7fazaSection extends StatelessWidget {
  const Elma7fazaSection({
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
      child: Column(
        children: [
          Material(
            child: InkWell(
              splashFactory: InkRipple.splashFactory,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container();
                  },
                );
              },
              child: Ink(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16.r,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مصروف الشهر',
                          style: AppStyles.textStyle24w400.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '840.00 ',
                                style: AppStyles.textStyle24w400.copyWith(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.colorBlack.withOpacity(0.7),
                                ),
                              ),
                              TextSpan(
                                text: 'ج.م',
                                style: AppStyles.textStyle24w400.copyWith(
                                  fontSize: 8.sp,
                                  color: AppColors.colorBlack.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                FontAwesomeIcons.noteSticky,
                size: 35,
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: SizedBox(
                  height: 35.h,
                  child: CustomFormField(
                    inputStyle: AppStyles.textStyle24w400.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 14.sp,
                    ),
                    hinttext: 'الملاحظات',
                    hintsize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
