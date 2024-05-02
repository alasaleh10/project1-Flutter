import 'package:flutter/material.dart';
import 'package:project1/core/utils/app_colors.dart';
import 'package:project1/views/spalsh_screen/splash_screen_body_view.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimColor,
      body: SafeArea(
        child: SplashScreenBodyView(),
      ),
    );
  }
}
