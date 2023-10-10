import 'package:flutter/material.dart';

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
    return PageView(
      onPageChanged: (value) {
        
      },
      children: [],
    );
  }
}
