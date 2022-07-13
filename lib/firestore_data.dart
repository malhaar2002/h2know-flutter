import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
var loggedInUser;
var loggedInUserName;
var loggedInUserEmail;
var loggedInUserFloor;

getCurrentUser() async {
  try{
    final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  } catch(e) {
    print(e);
  }
}

getUserData() async {
  await getCurrentUser();
  await _firestore
  .collection('users')
  .doc(loggedInUser!.email)
  .get()
  .then((value) async {
    loggedInUserName = await value.data()!['full_name'];
    loggedInUserEmail = await value.data()!['email'];
    loggedInUserFloor = await value.data()!['floor_no'];
    loggedInUserFloor = loggedInUserFloor.toString();
  });
}

