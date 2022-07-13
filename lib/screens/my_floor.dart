import 'package:flutter/material.dart';
import 'package:h2know_flutter/models/profile_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:h2know_flutter/widgets/navdrawer.dart';

class MyFloor extends StatefulWidget {
  const MyFloor({super.key});
  static const id = 'my_floor';

  @override
  State<MyFloor> createState() => _MyFloorState();
}

class _MyFloorState extends State<MyFloor> {
  final List<ProfileModel> data = [
    ProfileModel(
      day: "Mon",
      volume: 1000,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF2D8BBA)),
    ),
    ProfileModel(
      day: "Tues",
      volume: 900,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF41B8D5)),
    ),
    ProfileModel(
      day: "Wed",
      volume: 1200,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF6CE5E8)),
    ),
    ProfileModel(
      day: "Thurs",
      volume: 1100,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF50C2C9)),
    ),
    ProfileModel(
      day: "Fri",
      volume: 1500,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF41B8D5)),
    ),
    ProfileModel(
      day: "Sat",
      volume: 1400,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF6CE5E8)),
    ),
    ProfileModel(
      day: "Sun",
      volume: 700,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF50C2C9)),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    List<charts.Series<ProfileModel, String>> series = [
      charts.Series(
        id: "my_floor",
        data: data,
        domainFn: (ProfileModel series, _) => series.day,
        measureFn: (ProfileModel series, _) => series.volume,
        colorFn: (ProfileModel series, _) => series.color,
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
              'My Floor',
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
                      'Floor Stats',
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
                            children: const [
                              Text(
                                '1000',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
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
                            height: 24, child: VerticalDivider(color: Colors.black)),
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                '1200',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
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
                                '7500',
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
                            children: const [
                              Text(
                                '100',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
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
                            height: 24, child: VerticalDivider(color: Colors.black)),
                        Expanded(
                          child: Column(
                            children: const [
                              Text(
                                '120',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
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
                                ),
                              ),
                              Text(
                                'Weekly Average',
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