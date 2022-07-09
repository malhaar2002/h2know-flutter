import 'package:flutter/material.dart';
import 'package:h2know_flutter/models/ranking_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:h2know_flutter/widgets/navdrawer.dart';

class RankingGraph extends StatelessWidget {
  RankingGraph({super.key});
  static const id = 'ranking';
  final List<RankingModel> data = [
  RankingModel(
    floor: "Floor 1",
    volume: 50,
    color: charts.ColorUtil.fromDartColor(const Color(0xFF2D8BBA)),
  ),
  RankingModel(
    floor: "Floor 2",
    volume: 45,
    color: charts.ColorUtil.fromDartColor(const Color(0xFF41B8D5)),
  ),
  RankingModel(
    floor: "Floor 3",
    volume: 60,
    color: charts.ColorUtil.fromDartColor(const Color(0xFF6CE5E8)),
  ),
  RankingModel(
    floor: "Floor 4",
    volume: 55,
    color: charts.ColorUtil.fromDartColor(const Color(0xFF50C2C9)),
  ),
];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<RankingModel, String>> series = [
      charts.Series(
        id: "ranking",
        data: data,
        domainFn: (RankingModel series, _) => series.floor,
        measureFn: (RankingModel series, _) => series.volume,
        colorFn: (RankingModel series, _) => series.color,
      )
    ];
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Rankings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30, width: double.infinity),
            const Text(
              'Rankings',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Let's See How Your Floor is Doing Against Others"
            ),
            Container(
              width: 500,
              height: 600,
              padding: const EdgeInsets.all(50),
              child: charts.BarChart(
                series,
                animate: true,
              ),
            ),
            const SizedBox(height: 30, width: double.infinity),
          ],
        ),
      ),
    );
  }
}