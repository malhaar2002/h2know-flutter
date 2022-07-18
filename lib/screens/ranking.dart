import 'package:flutter/material.dart';
import 'package:h2know_flutter/constants/colours.dart';
import 'package:h2know_flutter/data/personal_info.dart';
import 'package:h2know_flutter/models/ranking_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:h2know_flutter/widgets/navdrawer.dart';
import 'package:h2know_flutter/data/ranking_info.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 0, width: double.infinity),
            const Text(
              'Rankings',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: Text(
                      'University Stats',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              FutureBuilder(
                                future: getTodayRanking(),
                                builder: (context, snapshot) {
                                  return Text(
                                    todayUniversity,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                    ),
                                  );
                                },
                              ),
                              const Text(
                                'Today',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 24,
                            child: VerticalDivider(color: Colors.black)),
                        Expanded(
                          child: Column(
                            children: [
                              FutureBuilder(
                                future: getAvgRanking(),
                                builder: (context, snapshot) {
                                  return Text(
                                    averageUniversity,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                    ),
                                  );
                                },
                              ),
                              const Text(
                                'Daily Average',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: Colors.black,
                            )),
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                '75000',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                'Last 7 Days',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: Text(
                      'Individual Stats',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              FutureBuilder(
                                future: getTodayRanking(),
                                builder: (context, snapshot) {
                                  bool todaySuccess = double.parse(todayVolume) <= double.parse(todayIndividualRanking) ? true : false;
                                  return Text(
                                    todayIndividualRanking,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: todaySuccess ? success : failure,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                              const Text(
                                "Today's Average",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 24,
                            child: VerticalDivider(color: Colors.black)),
                        Expanded(
                          child: Column(
                            children: [
                              FutureBuilder(
                                future: getAvgRanking(),
                                builder: (context, snapshot) {
                                  bool avgSuccess = double.parse(avgVolume) <= double.parse(averageIndividualRanking) ? true : false;
                                  return Text(
                                    averageIndividualRanking,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: avgSuccess ? success : failure,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                              const Text(
                                'Daily Average',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: Colors.black,
                            )),
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                '750',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: failure,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Last 7 Days',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
