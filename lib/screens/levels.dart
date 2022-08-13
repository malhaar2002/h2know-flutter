import 'package:flutter/material.dart';
import 'package:h2know_flutter/models/levels_model.dart';
import 'package:h2know_flutter/widgets/levels.tile.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});
  static const id = 'levels';

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();
  List<LevelTile> levelTiles = [];

  @override
  void initState() {
    super.initState();
    for (LevelModel element in levelsList) {
      levelTiles.add(LevelTile(level: element));
    }
    _controller.animateToItem(
      5,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: ListWheelScrollView(
          controller: _controller,
          itemExtent: 100,
          diameterRatio: 3,
          // magnification: 1.2,
          useMagnifier: true,
          overAndUnderCenterOpacity: 0.5,
          physics: const FixedExtentScrollPhysics(),
          children: levelTiles,
        ),
      ),
    );
  }
}
