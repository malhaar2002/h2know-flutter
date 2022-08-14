import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:h2know_flutter/constants/get_date.dart';

final FirebaseDatabase _database = FirebaseDatabase.instance;

String todayUniversity = '0';
String averageUniversity = '0';
String todayIndividualRanking = '0';
String averageIndividualRanking = '0';
String lastWeekUniversity = '0';
String lastWeekIndividual = '0';

getTodayRanking() async {
  double sum = 0.0;
  int ctrl = 0;
  String todayDate = getDate();
  DatabaseReference ref = _database.ref(todayDate);
  ref.onValue.listen((DatabaseEvent event) {
    Map<dynamic, dynamic> map = jsonDecode(jsonEncode(event.snapshot.value));
    for (var element in map.values) {
      sum += element;
      ctrl++;
    }
    todayUniversity = sum.toString();
    if (ctrl != 0) todayIndividualRanking = (sum / ctrl).toStringAsFixed(2);
  });
}

getAvgRanking() async {
  double sum = 0.0;
  int ctrlInd = 0;
  int ctrlFlr = 0;
  List<String> visitedDates = [];
  await _database.ref().once().then(
    (DatabaseEvent event) {
      Map<dynamic, dynamic> map = jsonDecode(jsonEncode(event.snapshot.value));
      map.forEach((key, value) {
        if (!visitedDates.contains(key)) {
          visitedDates.add(key);
          Map<dynamic, dynamic> map2 = jsonDecode(jsonEncode(value));
          map2.forEach(
            (key2, value2) {
              sum += double.parse(value2.toString());
              ctrlInd++;
            },
          );
          ctrlFlr++;
        }
      });
      averageUniversity = (sum / ctrlFlr).toStringAsFixed(2);
      if (ctrlInd != 0) averageIndividualRanking = (sum / ctrlInd).toStringAsFixed(2);
    },
  );
}

getLastWeekRanking() async {
  double sum = 0.0;
  int ctrl = 0;
  await _database.ref().once().then((DatabaseEvent event) {
    Map<dynamic, dynamic> map = jsonDecode(jsonEncode(event.snapshot.value));
    map.forEach((key, value) {
      if (getLastWeekDates().contains(key)) {
        Map<dynamic, dynamic> map2 = jsonDecode(jsonEncode(value));
        map2.forEach((key2, value2) {
          sum += double.parse(value2.toString());
          ctrl++;
        });
      }
    });
    lastWeekUniversity = sum.toString();
    lastWeekIndividual = (sum / ctrl).toStringAsFixed(2);
  });
}
