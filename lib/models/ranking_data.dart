import 'package:charts_flutter/flutter.dart' as charts;

class RankingModel {
  String floor;
  double volume;
  final charts.Color color;

  RankingModel({required this.floor, required this.volume, required this.color});
}