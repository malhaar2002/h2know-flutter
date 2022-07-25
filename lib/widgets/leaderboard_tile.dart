import 'package:flutter/material.dart';
import 'package:h2know_flutter/models/leaderboard_model.dart';

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({
    super.key,
    required this.leaderboard,
  });

  final LeaderboardModel leaderboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 90,
            child: ListTile(
              tileColor: leaderboard.highlighted? const Color(0xFFDFF0FF) : Theme.of(context).scaffoldBackgroundColor,
              leading: CircleAvatar(
                backgroundImage: leaderboard.topper ? const AssetImage('assets/images/gold_circle.png') : null,
                backgroundColor: Colors.transparent,
                radius: 50,
                child: CircleAvatar(
                  backgroundImage: leaderboard.pfpAsset ? const AssetImage('assets/images/profile_pic.jpg') : leaderboard.pfpNetwork,
                  radius: leaderboard.topper ? 23 : 30,
                ),
              ),
              title: Text(
                leaderboard.name,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              subtitle: Text(
                'Level ${leaderboard.level}',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              trailing: Text(
                '# ${leaderboard.rank}',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
            height: 1,
          )
        ],
      ),
    );
  }
}