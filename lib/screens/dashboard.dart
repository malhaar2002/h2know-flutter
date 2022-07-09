import 'package:flutter/material.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  static const id = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Center(
        child: Text('Your Dashboard'),
      ),
    );
  }
}