import 'package:flutter/material.dart';
import 'package:h2know_flutter/models/levels_model.dart';
import 'package:h2know_flutter/widgets/levels.tile.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});
  static const id = 'levels';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Levels',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
              itemCount: levelsList.length,
              physics: const ScrollPhysics(),
              itemBuilder:(context, index) {
                return LevelTile(
                  level: levelsList[index], 
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
