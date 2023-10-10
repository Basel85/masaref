import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/utils/app_assets.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/main/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:masaref/features/main/presentation/main_screen.dart';
import 'package:masaref/features/on_boarding/presentation/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => BlocProvider<BottomNavigationBarCubit>(
                  create: (context) => BottomNavigationBarCubit(),
                  child: const MainScreen())));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: Image.asset(
        AppAssets.logo,
      )),
    );
  }
}
