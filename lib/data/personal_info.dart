import 'package:h2know_flutter/constants/create_username.dart';
import 'package:h2know_flutter/constants/get_date.dart';
import 'package:h2know_flutter/data/current_user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

final FirebaseDatabase _database = FirebaseDatabase.instance;

String todayVolume = '0';
String avgVolume = '0';
String weekVolume = '0';

getTodayVolume() async {
  if (loggedInUser == null) await getCurrentUser();
  String todayDate = getDate();
  String username = createUsername(loggedInUser.email);
  DatabaseReference ref = _database.ref('$todayDate/$username');
  ref.onValue.listen((DatabaseEvent event) {
    if (event.snapshot.value.runtimeType != Null)
      todayVolume = event.snapshot.value.toString();
  });
}

getAvgVolume() async {
  double sum = 0.0;
  int ctrl = 0;
  if (loggedInUser == null) await getCurrentUser();
  await _database.ref().once().then(
    (DatabaseEvent event) {
      Map<dynamic, dynamic> map = jsonDecode(jsonEncode(event.snapshot.value));
      map.forEach((key, value) {
        Map<dynamic, dynamic> map2 = jsonDecode(jsonEncode(value));
        map2.forEach(
          (key2, value2) {
            if (key2 == createUsername(loggedInUser.email)) {
              sum += double.parse(value2.toString());
              ctrl++;
            }
          },
        );
      });
      avgVolume = (sum / ctrl).toString();
    },
  );
}

getWeekVolume() async {
  double sum = 0.0;
  if (loggedInUser == null) await getCurrentUser();
  await _database.ref().once().then(
    (event) {
      Map<dynamic, dynamic> map = jsonDecode(jsonEncode(event.snapshot.value));
      map.forEach((key, value) {
        if (getLastWeekDates().contains(key)) {
          Map<dynamic, dynamic> map2 = jsonDecode(jsonEncode(value));
          map2.forEach(
            (key2, value2) {
              if (key2 == createUsername(loggedInUser.email)) {
                sum += double.parse(value2.toString());
              }
            },
          );
        }
      });
      weekVolume = sum.toString();
    },
  );
}
