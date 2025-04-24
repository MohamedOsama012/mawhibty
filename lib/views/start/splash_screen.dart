import 'package:flutter/material.dart';
import 'package:mawhibty/constants/colors.dart';
import 'package:mawhibty/views/start/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          (route) => false);
    });

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset('assets/images/logo.jpg'),
      ),
    );
  }
}
