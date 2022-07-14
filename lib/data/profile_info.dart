import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:h2know_flutter/data/current_user.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

String loggedInUserName = 'null';
String loggedInUserEmail = 'null';
String loggedInUserFloor = 'null';

getUserData() async {
  await getCurrentUser();
  await _firestore
  .collection('users')
  .doc(loggedInUser!.email)
  .get()
  .then((value) async {
    loggedInUserName = await value.data()!['full_name'];
    loggedInUserEmail = await value.data()!['email'];
    int intFloor = await value.data()!['floor_no'];
    loggedInUserFloor = intFloor.toString();
  });
}