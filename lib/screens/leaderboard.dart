import 'package:flutter/material.dart';
import 'package:h2know_flutter/constants/get_random.dart';
import 'package:h2know_flutter/data/leaderboard_info.dart';
import 'package:h2know_flutter/data/profile_info.dart';
import 'package:h2know_flutter/widgets/leadboard_listview.dart';
import 'package:h2know_flutter/widgets/leaderboard_tile.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});
  static const id = 'leaderboard';

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
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
