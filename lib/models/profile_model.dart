import 'package:charts_flutter/flutter.dart' as charts;

class ProfileModel {
  String day;
  double volume;
  final charts.Color color;

  ProfileModel({required this.day, required this.volume, required this.color});
}