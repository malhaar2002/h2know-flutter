import 'package:flutter/material.dart';
import 'package:h2know_flutter/data/profile_info.dart';
import 'package:h2know_flutter/screens/dashboard.dart';

class DiverAnimation extends StatefulWidget {
  const DiverAnimation({super.key});
  static const id = "diver_animation";

  @override
  State<DiverAnimation> createState() => _DiverAnimationState();
}

class _DiverAnimationState extends State<DiverAnimation> {
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 10),
          () => Navigator.pushNamed(context, Dashboard.id)
        ),
        builder: (context, snapshot) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/DivePortrait.gif',
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
