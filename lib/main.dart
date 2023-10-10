import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masaref/core/app_cubit/whole_app_cubit.dart';
import 'package:masaref/core/app_cubit/whole_app_state.dart';
import 'package:masaref/core/helpers/cache_helper.dart';
import 'package:masaref/core/helpers/db_helper.dart';
import 'package:masaref/core/helpers/observer.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/mo3amalat_tap/presentation/view/mo3amalat_tap.dart';
// import 'package:masaref/features/splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observer();
  await CacheHelper.init();
  await DBHelper().createDatabase();
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
    return ScreenUtilInit(
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
                home: const Mo3amalatTap(),
              );
            },
          ),
        ),
      ),
    );
  }
}
