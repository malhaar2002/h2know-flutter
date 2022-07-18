import 'package:flutter/material.dart';

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({
    super.key,
    this.pfp = const AssetImage('assets/images/profile_pic.jpg'),
    this.name = '',
    this.level = '',
    this.rank = '',
    this.highlighted = false,
  });

  final AssetImage pfp;
  final String name;
  final String level;
  final String rank;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 90,
            child: ListTile(
              tileColor: highlighted? const Color(0xFFDFF0FF) : Theme.of(context).scaffoldBackgroundColor,
              leading: CircleAvatar(
                backgroundImage: pfp,
                radius: 40,
              ),
              title: Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              subtitle: Text(
                'Level $level',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
              trailing: Text(
                '# $rank',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
            height: 1,
          )
        ],
      ),
    );
  }
}