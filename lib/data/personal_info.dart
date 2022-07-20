import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h2know_flutter/constants/get_date.dart';
import 'package:h2know_flutter/data/current_user.dart';
import 'package:h2know_flutter/data/profile_info.dart';

final _firestore = FirebaseFirestore.instance;

String todayVolume = '0';
String avgVolume = '0';
String weekVolume = '0';

getTodayVolume() async {
  if (loggedInUser == null) await getCurrentUser();
  await _firestore
  .collection('showers')
  .where('user_email', isEqualTo: loggedInUser.email)
  .where('date', isEqualTo: getDate())
  .get()
  .then((value) {
    try {
      todayVolume = value.docs.first.data()['volume'].toString();
    } catch(e) {
      todayVolume = '0';
    }
  });
}

getAvgVolume() async {
  double sum = 0.0;
  if (loggedInUser == null) await getCurrentUser();
  await _firestore
  .collection('showers')
  .where('user_email', isEqualTo: loggedInUser.email)
  .get()
  .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      sum = sum + (doc['volume'].toDouble());
    }
    if (querySnapshot.size != 0) avgVolume = (sum/querySnapshot.size).toString();
  });
}

getWeekVolume() async {
  double sum = 0.0;
  if (loggedInUser == null) await getCurrentUser();
  await _firestore
  .collection('showers')
  .where('user_email', isEqualTo: loggedInUser.email)
  .where('date', whereIn: getLastWeekDates())
  .get()
  .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      sum += doc['volume'].toDouble();
    }
    weekVolume = sum.toString();
  });
}