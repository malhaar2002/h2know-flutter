import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
var loggedInUser = null;

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