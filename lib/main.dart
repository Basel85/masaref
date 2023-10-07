import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masaref/core/helpers/cache_helper.dart';
import 'package:masaref/core/helpers/observer.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/mo3amalat/presentation/view/mo3amalat_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observer();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: AppColors.primaryColor,
            ),
          ),
          home: Mo3amalatPage(),
        ),
      ),
    );
  }
}
