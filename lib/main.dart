import 'package:flutter/material.dart';
import 'package:h2know_flutter/screens/dashboard.dart';
import 'package:h2know_flutter/screens/login.dart';
import 'package:h2know_flutter/screens/ranking.dart';
import 'package:h2know_flutter/screens/register.dart';
import 'package:h2know_flutter/screens/welcome.dart';
import 'package:h2know_flutter/screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder:(context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print("Could not initialize firebase app");
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Welcome.id,
            routes: {
              Welcome.id:(context) => const Welcome(),
              Register.id:(context) => const Register(),
              Login.id:(context) => const Login(),
              RankingGraph.id: (context) => RankingGraph(),
              Dashboard.id:(context) => const Dashboard(),
              Profile.id:(context) => Profile(),
            },
          );
        }
        return const Center(child: Text('Loading'));
      },
    );
  }
}
