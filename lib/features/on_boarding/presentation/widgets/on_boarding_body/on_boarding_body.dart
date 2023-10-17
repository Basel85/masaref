import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/on_boarding/presentation/widgets/on_boarding_body/on_boarding_button.dart';
import 'package:masaref/features/on_boarding/presentation/widgets/on_boarding_body/skip_button.dart';

class OnBoardingBody extends StatelessWidget {
  final Color color;
  final Widget icon;
  final String title;
  final String descirpiton;
  final void Function() onTap;
  final String buttonText;
  const OnBoardingBody(
      {super.key,
      required this.color,
      required this.icon,
      required this.title,
      required this.descirpiton,
      required this.onTap,
      this.buttonText = "التالي"});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: color,
        ),
        Positioned(right: 12.w, top: 4.h, child: const SkipButton()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200.r,
                child: Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 100.r,
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 80.r,
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 60.r,
                      ),
                    ),
                    Center(child: icon)
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.colorWhite),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                descirpiton,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.colorWhite),
              ),
              SizedBox(
                height: 40.h,
              ),
              OnBoardingButton(buttonText: buttonText, onTap: onTap)
            ],
          ),
        ),
      ],
    );
  }
}
