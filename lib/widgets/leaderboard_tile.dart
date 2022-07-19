import 'package:flutter/material.dart';

class LeaderboardTile extends StatelessWidget {
  const LeaderboardTile({
    super.key,
    this.pfpNetwork = const NetworkImage('https://avatars.dicebear.com/api/avataaars/100.svg'),
    this.pfpAsset = false,
    this.name = '',
    this.level = '',
    this.rank = '',
    this.highlighted = false,
  });

  final ImageProvider<Object> pfpNetwork;
  final bool pfpAsset;
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
                backgroundImage: pfpAsset ? const AssetImage('assets/images/profile_pic.jpg') : pfpNetwork,
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