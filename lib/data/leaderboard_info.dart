import 'package:sortedmap/sortedmap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var nameAndLevel = SortedMap(const Ordering.byValue());

getNameAndLevel () async {
  await FirebaseFirestore.instance
  .collection('users')
  .get()
  .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      nameAndLevel.addAll({doc['full_name']:doc['level']});
    }
    print(nameAndLevel);
  });
}