import 'package:flutter/material.dart';
import 'package:h2know_flutter/data/leaderboard_info.dart';
import 'package:h2know_flutter/widgets/leadboard_listview.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});
  static const id = 'leaderboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Leaderboard',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/leaderboard_star.png',
                width: 150,
              ),
            ),
            const SizedBox(height: 40),
            leaderboardList.isEmpty
                ? FutureBuilder(
                    future: getLeaderboard(),
                    builder: (context, snapshot) {
                      // If you make this constant, the leaderboard won't load the first time you open it but will load for all subsequent times
                      // ignore: prefer_const_constructors
                      return LeaderboardListview();
                    },
                  )
                : const LeaderboardListview(),
          ],
        ),
      ),
    );
  }
}
