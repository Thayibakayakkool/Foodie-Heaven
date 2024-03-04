import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foodie_heaven/src/core/constants/colors.dart';
import 'package:foodie_heaven/src/features/presentation/features/pages/auth/login_page/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 350,
        backgroundColor: AppColors().blackColors,
        splash: 'assets/images/Foodie heavan.png',
        nextScreen: const LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 1600,
      ),
    );
  }
}
