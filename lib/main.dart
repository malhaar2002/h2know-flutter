import 'package:flutter/material.dart';
import 'package:h2know_flutter/screens/dashboard.dart';
import 'package:h2know_flutter/screens/edit_profile.dart';
import 'package:h2know_flutter/screens/login.dart';
import 'package:h2know_flutter/screens/my_floor.dart';
import 'package:h2know_flutter/screens/ranking.dart';
import 'package:h2know_flutter/screens/register.dart';
import 'package:h2know_flutter/screens/welcome.dart';
import 'package:h2know_flutter/screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Welcome.id,
      routes: {
        Welcome.id:(context) => const Welcome(),
        Register.id:(context) => const Register(),
        Login.id:(context) => const Login(),
        RankingGraph.id: (context) => RankingGraph(),
        Dashboard.id:(context) => const Dashboard(),
        Profile.id:(context) => const Profile(),
        EditProfile.id:(context) => const EditProfile(),
        MyFloor.id:(context) => const MyFloor(),
      },
    );
  }
}