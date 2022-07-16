import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:h2know_flutter/screens/dashboard.dart';
import 'package:h2know_flutter/data/profile_info.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = "splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          duration: 1000,
          splash: Image.asset('assets/images/logo.png'),
          splashIconSize: 250,
          nextScreen: const Dashboard(),
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}
