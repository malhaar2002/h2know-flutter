import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h2know_flutter/data/profile_info.dart';
import 'package:h2know_flutter/widgets/get_date.dart';

final _firestore = FirebaseFirestore.instance;

String todayFloor = '0';
String todayIndividual = '0';
String avgFloor = '0';
String avgIndividual = '0';

Future<bool> checkSameFloor(String email) async {
  bool ans = false;
  if (loggedInUserFloor == 'null') await getUserData();
  await _firestore
  .collection('users')
  .doc(email)
  .get()
  .then((value) {
    int floor = value.data()!['floor_no'];
    if (floor.toString() == loggedInUserFloor) {
      ans = true;
    } else {
      ans = false;
    }
  });
  return ans;
}

getTodayFloor() async {
  double sum = 0.0;
  if (loggedInUserFloor == 'null') await getUserData(); 
  await _firestore
  .collection('showers')
  .where('date', isEqualTo: getDate())
  .get()
  .then((QuerySnapshot querySnapshot) async {
    for (var doc in querySnapshot.docs) {
      bool sameFloorCheck = await checkSameFloor(doc['user_email']);
      if (sameFloorCheck) {
        sum = sum + (doc['volume'].toDouble());
      }
    }
    todayFloor = sum.toString();
    todayIndividual = (sum/querySnapshot.size).toString();
  });
}