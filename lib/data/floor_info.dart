import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:h2know_flutter/data/profile_info.dart';
import 'package:h2know_flutter/constants/get_date.dart';
import 'dart:convert';

final _firestore = FirebaseFirestore.instance;
final _database = FirebaseDatabase.instance;

String todayFloor = '0';
String todayIndividual = '0';
String avgFloor = '0';
String avgIndividual = '0';
String last7DaysFloor = '0';
String last7DaysIndividual = '0';

Future<bool> checkSameFloor(String username) async {
  bool ans = false;
  if (loggedInUserFloor == 'null') await getUserData();
  await _firestore
      .collection('users')
      .where('username', isEqualTo: username)
      .get()
      .then((QuerySnapshot querySnapshot) {
    int floor = querySnapshot.docs.first['floor_no'];
    if (floor.toString() == loggedInUserFloor) {
      ans = true;
    } else {
      ans = false;
    }
  });
  return ans;
}

// FIXME: Nahi chal raha bc
getTodayFloor() async {
  double sum = 0.0;
  int ctrl = 0;
  if (loggedInUserFloor == 'null') await getUserData();
  String todayDate = getDate();
  _database.ref(todayDate).once().then(
    (DatabaseEvent event) {
      Map<dynamic, dynamic> map = jsonDecode(jsonEncode(event.snapshot.value));
      map.forEach(
        (key, value) async {
          if (await checkSameFloor(key)) {
            sum += value;
            ctrl++;
          }
        },
      );
      todayFloor = sum.toString();
      if (ctrl != 0) todayIndividual = (sum / ctrl).toStringAsFixed(2);
    },
  );
}

getAvgFloor() async {
  // double sum = 0.0;
  // int ctrlInd = 0;
  // int ctrlFlr = 0;
  // List<String> visitedDates = [];
  // if (loggedInUser == null) await getUserData();
  // await _firestore
  //     .collection('showers')
  //     .get()
  //     .then((QuerySnapshot querySnapshot) async {
  //   for (var doc in querySnapshot.docs) {
  //     bool sameFloorCheck = await checkSameFloor(doc['user_email']);
  //     if (sameFloorCheck) {
  //       sum += doc['volume'].toDouble();
  //       ctrlInd++;
  //       if (!visitedDates.contains(doc['date'])) {
  //         ctrlFlr++;
  //         visitedDates.add(doc['date']);
  //       }
  //     }
  //   }
  //   if (ctrlInd != 0) avgIndividual = (sum / ctrlInd).toStringAsFixed(2);
  //   if (ctrlFlr != 0) avgFloor = (sum / ctrlFlr).toStringAsFixed(2);
  // });
}

getLast7DaysFloor() async {
  // double sumFloor = 0.0;
  // int ctrl = 0;
  // if (loggedInUser == null) await getUserData();
  // await _firestore
  //     .collection('showers')
  //     .where('date', whereIn: getLastWeekDates())
  //     .get()
  //     .then((QuerySnapshot querySnapshot) async {
  //   for (var doc in querySnapshot.docs) {
  //     bool sameFloorCheck = await checkSameFloor(doc['user_email']);
  //     if (sameFloorCheck) {
  //       sumFloor += doc['volume'].toDouble();
  //       ctrl++;
  //     }
  //   }
  //   last7DaysFloor = sumFloor.toStringAsFixed(2);
  //   if (ctrl != 0) last7DaysIndividual = (sumFloor / ctrl).toStringAsFixed(2);
  // });
}
