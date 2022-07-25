import 'package:flutter/material.dart';
import 'package:h2know_flutter/data/leaderboard_info.dart';
import 'package:h2know_flutter/widgets/leaderboard_tile.dart';

class LeaderboardListview extends StatelessWidget {
  const LeaderboardListview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: leaderboardList.length,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return LeaderboardTile(
          leaderboard: leaderboardList[index],
        );
      },
    );
  }
}
