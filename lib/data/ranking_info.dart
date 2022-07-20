import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h2know_flutter/constants/get_date.dart';

final _firestore = FirebaseFirestore.instance;

String todayUniversity = '0';
String averageUniversity = '0';
String todayIndividualRanking = '0';
String averageIndividualRanking = '0';
String lastWeekUniversity = '0';
String lastWeekIndividual = '0';

getTodayRanking() async {
  double sum = 0.0;
  await _firestore
  .collection('showers')
  .where('date', isEqualTo: getDate())
  .get()
  .then((QuerySnapshot querySnapshot) async {
    for (var doc in querySnapshot.docs) {
      sum += doc['volume'].toDouble();
    }
    todayUniversity = sum.toString();
    if (querySnapshot.size != 0) todayIndividualRanking = (sum/querySnapshot.size).toString();
  });
}

getAvgRanking() async {
  double sum = 0.0;
  int ctrlInd = 0;
  int ctrlFlr = 0;
  List<String> visitedDates = [];
  await _firestore
  .collection('showers')
  .get()
  .then((QuerySnapshot querySnapshot) async {
    for (var doc in querySnapshot.docs) {
      sum += doc['volume'].toDouble();
      ctrlInd++;
      if (!visitedDates.contains(doc['date'])) {
        ctrlFlr++;
        visitedDates.add(doc['date']);
      }
    }
    if (ctrlInd != 0) averageIndividualRanking = (sum/ctrlInd).toString();
    if (ctrlFlr != 0) averageUniversity = (sum/ctrlFlr).toString();
  });
 
}

getLastWeekRanking() async {
  double sum = 0.0;
  await _firestore
  .collection('showers')
  .where('date', whereIn: getLastWeekDates())
  .get()
  .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      sum += doc['volume'].toDouble();
    }
    lastWeekUniversity = sum.toString();
    if (querySnapshot.size != 0) lastWeekIndividual = (sum/querySnapshot.size).toString();
  });
}