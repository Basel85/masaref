import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masaref/core/utils/app_assets.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/core/utils/snack_bar_viewer.dart';
import 'package:masaref/features/main/presentation/main_screen.dart';
import 'package:masaref/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_states.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SnackBarViewer {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => GetAllWalletsCubit.get(context).getAllWallets());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocListener<GetAllWalletsCubit, GetAllWalletsStates>(
        listener: (context, state) {
          if (state is GetAllWalletsSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => state.wallets.isEmpty
                        ? const OnBoardingScreen()
                        : const MainScreen()));
          } else if (state is GetAllWalletsErrorState) {
            showSnackBar(
                context: context,
                message: state.errorMessage,
                backgroundColor: Colors.red);
          }
        },
        child: Center(
            child: Image.asset(
          AppAssets.logo,
        )),
      ),
    );
  }
}
