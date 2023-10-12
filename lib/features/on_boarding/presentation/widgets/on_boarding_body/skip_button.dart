import 'package:flutter/material.dart';
import 'package:masaref/core/utils/app_colors.dart';
import 'package:masaref/features/initial/presentation/initial_screen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const InitialScreen()));
      },
      child: const Text(
        "تخطي",
        style: TextStyle(color: AppColors.colorWhite),
      ),
    );
  }
}
