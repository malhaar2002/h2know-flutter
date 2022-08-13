import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h2know_flutter/data/current_user.dart';

final _firestore = FirebaseFirestore.instance;

String loggedInUserName = 'null';
String loggedInUserUsername = 'null';
String loggedInUserFloor = 'null';

getUserData() async {
  await getCurrentUser();
  await _firestore
  .collection('users')
  .doc(loggedInUser!.email)
  .get()
  .then((value) async {
    loggedInUserName = await value.data()!['full_name'];
    loggedInUserUsername = await value.data()!['username'];
    int intFloor = await value.data()!['floor_no'];
    loggedInUserFloor = intFloor.toString();
  });
}