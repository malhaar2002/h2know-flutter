import 'package:flutter/material.dart';
import 'package:h2know_flutter/data/personal_info.dart';
import 'package:h2know_flutter/data/profile_info.dart';
import 'package:h2know_flutter/screens/edit_profile.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';
import 'package:h2know_flutter/widgets/rounded_button.dart';
import 'package:h2know_flutter/models/profile_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class Profile extends StatefulWidget {
  const Profile({super.key});
  static const id = 'profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final List<ProfileModel> data = [
    ProfileModel(
      day: "Mon",
      volume: 100,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF2D8BBA)),
    ),
    ProfileModel(
      day: "Tues",
      volume: 90,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF41B8D5)),
    ),
    ProfileModel(
      day: "Wed",
      volume: 120,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF6CE5E8)),
    ),
    ProfileModel(
      day: "Thurs",
      volume: 110,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF50C2C9)),
    ),
    ProfileModel(
      day: "Fri",
      volume: 150,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF41B8D5)),
    ),
    ProfileModel(
      day: "Sat",
      volume: 140,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF6CE5E8)),
    ),
    ProfileModel(
      day: "Sun",
      volume: 70,
      color: charts.ColorUtil.fromDartColor(const Color(0xFF50C2C9)),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    List<charts.Series<ProfileModel, String>> series = [
      charts.Series(
        id: "profile",
        data: data,
        domainFn: (ProfileModel series, _) => series.day,
        measureFn: (ProfileModel series, _) => series.volume,
        colorFn: (ProfileModel series, _) => series.color,
      )
    ];

    return FutureBuilder(
      future: getUserData(),
      builder:(context, snapshot) {
        // if (snapshot.hasData) {
          return Scaffold(
            drawer: NavDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Hero(
                      tag: 'profile_img',
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/profile_pic.jpg'
                        ),
                        radius: 50,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      loggedInUserName,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Level 1',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    RoundedButton(
                      text: 'Update Profile',
                      onPressed: () {
                        Navigator.pushNamed(context, EditProfile.id);
                      },
                      colour: Colors.blueAccent,
                    ),
                    const SizedBox(height: 24),
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
                                  future: getTodayVolume(),
                                  builder:(context, snapshot) {
                                    return Text(
                                      todayVolume,
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
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                            child: VerticalDivider(color: Colors.black)
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                FutureBuilder(
                                  future: getAvgVolume(),
                                  builder: (context, snapshot) {
                                    return Text(
                                      avgVolume,
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
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                            child: VerticalDivider(color: Colors.black,)
                          ),
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
                                  'Last 7 Days',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
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
                  ],
                ),
              ),
            ),
          );
        // } else {
        //   return const Center(
        //     child: Text('Loading...'),
        //   );
        // }
      },
    );
  }
}