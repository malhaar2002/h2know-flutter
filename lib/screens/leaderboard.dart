import 'package:flutter/material.dart';
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
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      body: ListView(
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
          const LeaderboardTile(name: 'Malhaar Arora', level: '5', rank: '1'),
          const LeaderboardTile(name: 'Aditya Tyagi', level: '3', rank: '2'),
          const LeaderboardTile(name: 'Surabhi Tannu', level: '2', rank: '3'),
          const LeaderboardTile(name: 'Shubham Jain', level: '1', rank: '4', highlighted: true),
          const LeaderboardTile(name: 'Spandan Panda', level: '1', rank: '4'),
        ],
      ),
    );
  }
}