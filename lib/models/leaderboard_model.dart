import 'package:flutter/painting.dart';

class LeaderboardModel {
  final ImageProvider<Object> pfpNetwork;
  final bool pfpAsset;
  final String name;
  final int level;
  final bool highlighted;
  int rank;
  bool topper;

  LeaderboardModel({
    required this.pfpNetwork,
    this.pfpAsset = false,
    required this.name,
    required this.level,
    this.highlighted = false,
    this.rank = 0,
    this.topper = false,
  });
}