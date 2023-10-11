import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/cubits/image_picker/image_picker_cubit.dart';
import 'package:masaref/core/helpers/cache_helper.dart';
import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/core/helpers/observer.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/add_new_wallet/cubits/add_new_wallet/add_new_wallet_cubit.dart';
import 'package:masaref/features/categories/cubits/get_categories_of_section/get_categories_of_section_cubit.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/mo3amalat_tap.dart';

import 'package:masaref/features/add_new_category/cubits/get_main_type_of_transaction/get_main_type_of_transaction_cubit.dart';
import 'package:masaref/features/add_new_category/presentation/add_new_category_screen.dart';
import 'package:masaref/features/add_new_wallet/cubits/check_box/check_box_cubit.dart';
import 'package:masaref/features/add_new_wallet/presentation/add_new_wallet.dart';
import 'package:masaref/features/categories/presentation/categories_screen.dart';
import 'package:masaref/features/exchange_between_two_wallets/presentation/exchange_between_two_wallets_screen.dart';
import 'package:masaref/features/main/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:masaref/features/main/presentation/main_screen.dart';

import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/mo3amala/presentation/view/mo3amala.dart';
import 'package:masaref/features/splash/presentation/splash_screen.dart';
import 'package:masaref/features/wallets/cubits/get_all_wallets/get_all_wallets_cubit.dart';
import 'package:masaref/features/wallets/presentation/wallets_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observer();
  await CacheHelper.init();
  await DBHelper.createDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllWalletsCubit>(create: (_) => GetAllWalletsCubit()),
        BlocProvider<GetCategoriesOfSectionCubit>(
            create: (_) => GetCategoriesOfSectionCubit()),
        BlocProvider<AddNewWalletCubit>(create: (_) => AddNewWalletCubit()),
        BlocProvider<ImagePickerCubit>(create: (_) => ImagePickerCubit()),
        BlocProvider<BottomNavigationBarCubit>(
          create: (context) => BottomNavigationBarCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider(
            create: (context) => WholeAppCubit(),
            child: BlocBuilder<WholeAppCubit, WholeAppStates>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: BlocProvider.of<WholeAppCubit>(context).isdark
                      ? ThemeData(
                          fontFamily: GoogleFonts.cairo().fontFamily,
                          appBarTheme: const AppBarTheme(
                            color: AppColors.primaryColor,
                          ),
                          scaffoldBackgroundColor: AppColors.darkMode,
                        )
                      : ThemeData(
                          fontFamily: GoogleFonts.cairo().fontFamily,
                          appBarTheme: const AppBarTheme(
                            color: AppColors.primaryColor,
                          ),
                          scaffoldBackgroundColor: AppColors.lightMode,
                        ),
                  home: const SplashScreen(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
