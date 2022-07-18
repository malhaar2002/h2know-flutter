import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:h2know_flutter/screens/dashboard.dart';
import 'package:h2know_flutter/screens/edit_profile.dart';
import 'package:h2know_flutter/screens/leaderboard.dart';
import 'package:h2know_flutter/screens/login.dart';
import 'package:h2know_flutter/screens/my_floor.dart';
import 'package:h2know_flutter/screens/ranking.dart';
import 'package:h2know_flutter/screens/register.dart';
import 'package:h2know_flutter/screens/splash_screen.dart';
import 'package:h2know_flutter/screens/welcome.dart';
import 'package:h2know_flutter/screens/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late StreamSubscription<User?> user;

  // To keep the user signed in when they restart the app
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (kDebugMode) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in');
          print(user.email);
        }
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null ? Welcome.id : SplashScreen.id,
      routes: {
        Welcome.id: (context) => const Welcome(),
        Register.id: (context) => const Register(),
        Login.id: (context) => const Login(),
        RankingGraph.id: (context) => RankingGraph(),
        Dashboard.id: (context) => const Dashboard(),
        Profile.id: (context) => const Profile(),
        EditProfile.id: (context) => const EditProfile(),
        MyFloor.id: (context) => const MyFloor(),
        SplashScreen.id: (context) => const SplashScreen(),
        Leaderboard.id: (context) => const Leaderboard(),
      },
    );
  }
}
