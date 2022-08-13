import 'package:flutter/material.dart';
import 'package:h2know_flutter/screens/profile.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  static const id = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () => Navigator.pushNamed(context, Profile.id),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/SwimPortraitGif.gif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
