import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:h2know_flutter/screens/dashboard.dart';
import 'package:h2know_flutter/screens/profile.dart';
import 'package:h2know_flutter/screens/ranking.dart';
import 'package:h2know_flutter/screens/welcome.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({super.key});
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
                color: Color(0xFF50C2C9),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://media.istockphoto.com/vectors/cute-panda-paws-up-over-wall-panda-face-cartoon-icon-vector-vector-id1162669873?k=20&m=1162669873&s=612x612&w=0&h=Vug2BRV7LEdrUNLp1rwSlpUNa0Vv7qh-l4hI1eDk2vw='),
                    radius: 40,
                  ),
                  Text(
                    'Welcome, Panda',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Dashboard'),
            onTap: () => {
              Navigator.pushNamed(context, Dashboard.id)
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_people),
            title: const Text('Profile'),
            onTap: () => {
              Navigator.pushNamed(context, Profile.id)
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Floor Data'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.auto_graph),
            title: const Text('Rankings'),
            onTap: () => {
              Navigator.pushNamed(context, RankingGraph.id)
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {
              _auth.signOut(),
              Navigator.pushNamed(context, Welcome.id)
            },
          ),
        ],
      ),
    );
  }
}