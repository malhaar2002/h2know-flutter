import 'package:flutter/material.dart';
import 'package:h2know_flutter/data/leaderboard_info.dart';
import 'package:h2know_flutter/data/profile_info.dart';
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
      body: Column(
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
          FutureBuilder(
            future: getNameAndLevel(),
            builder: (context, snapshot) {
              int rank = 1;
              List nameAndLevelKeys = nameAndLevel.keys.toList();
              nameAndLevelKeys = List.from(nameAndLevelKeys.reversed);
              return SingleChildScrollView(
                child: Column(
                  children: List.from(
                    nameAndLevelKeys.map(
                      (key) => LeaderboardTile(
                        name: key.toString(),
                        level: nameAndLevel[key].toString(),
                        highlighted: key == loggedInUserName ? true : false,
                        rank: (rank++).toString(),
                      )
                    )
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
