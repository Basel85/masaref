import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/initial/presentation/initial_screen.dart';
import 'package:masaref/features/on_boarding/presentation/widgets/on_boarding_body/on_boarding_body.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // ignore: unused_field
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            OnBoardingBody(
              color: AppColors.primaryColor,
              icon: Icon(
                Icons.money_rounded,
                color: AppColors.colorWhite,
                size: 30.r,
              ),
              title: "المصاريف",
              descirpiton: "احسبها صح.. كن علي علم بمصاريفك و مصادر دخلك",
              onTap: () {
                _pageController.jumpToPage(1);
              },
            ),
            OnBoardingBody(
              color: AppColors.colorPurple,
              icon: Text(
                "اضافة",
                style: TextStyle(color: AppColors.colorWhite, fontSize: 20.sp),
              ),
              title: "تسجبل المعاملات",
              descirpiton:
                  "كل ما هو عليك هو ادخال التكلفة و بند المعاملة (مصروف او دخل)",
              onTap: () {
                _pageController.jumpToPage(2);
              },
            ),
            OnBoardingBody(
              color: AppColors.primaryColor.withOpacity(0.5),
              icon: Icon(
                Icons.repeat,
                color: AppColors.colorWhite,
                size: 30.r,
              ),
              title: "تكرار المعاملة",
              descirpiton:
                  "بتفعيل تكرار المعاملة, سيتم تكرار المعاملات (رواتب / فواتير / اقساط) دون اي تدخل منك مع استلام تنبيه قبل الموعد",
              onTap: () {
                _pageController.jumpToPage(3);
              },
            ),
            OnBoardingBody(
              color: AppColors.colorYellow,
              icon: Icon(
                Icons.money,
                color: AppColors.colorWhite,
                size: 30.r,
              ),
              title: "الميزانية الشهرية",
              descirpiton:
                  "تابع مصاريفك و احرص علي عدم تخطي الحد الاقصي لميزانيتك الشهرية لجميع الاقسام او كل قسم علي حد (فواتير / مواصلات / مصروفات شخصية / اقساط / اخري)",
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InitialScreen()));
              },
              buttonText: "ابدأ",
            ),
          ],
        ),
      ),
    );
  }
}
