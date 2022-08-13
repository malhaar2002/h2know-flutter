import 'package:flutter/material.dart';
import 'package:h2know_flutter/models/levels_model.dart';

class LevelTile extends StatelessWidget {
  const LevelTile({super.key, required this.level});
  final LevelModel level;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: level.levelNo < 5
          ? const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
            )
          : const Icon(Icons.lock),
      title: Text(
        'Level ${level.levelNo}',
        style: const TextStyle(
          fontFamily: 'Poppins',
        ),
      ),
      subtitle: Text(
        level.description,
      ),
      // tileColor: level.levelNo == 5 ? Colors.lightBlue : Colors.transparent,
    );
  }
}
