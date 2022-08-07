import 'package:flutter/material.dart';
import 'package:h2know_flutter/constants/get_random.dart';
import 'package:h2know_flutter/data/current_user.dart';
import 'package:h2know_flutter/data/profile_info.dart';
import 'package:h2know_flutter/models/leaderboard_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<LeaderboardModel> leaderboardList = [];
int rank = 1;

getLeaderboard() async {
  if (loggedInUser == null) await getUserData();
  await FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      int rng = getRandom();
      leaderboardList.add(LeaderboardModel(
        pfpNetwork:
            NetworkImage('https://avatars.dicebear.com/api/avataaars/$rng.jpg'),
        pfpAsset: doc['email'] == loggedInUserEmail ? true : false,
        name: doc['full_name'],
        level: doc['level'],
        highlighted: doc['email'] == loggedInUserEmail ? true : false,
      ));
    }
    leaderboardList.sort((b, a) => (a.level).compareTo(b.level));

    for (int i = 0; i < leaderboardList.length; i++) {
      leaderboardList[i].rank = i + 1;
      if (i <= 2) leaderboardList[i].topper = true;
    }
  });
}
