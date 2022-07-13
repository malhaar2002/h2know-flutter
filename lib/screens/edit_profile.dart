import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:h2know_flutter/widgets/navdrawer.dart';
import 'package:h2know_flutter/widgets/rounded_button.dart';
import 'package:h2know_flutter/widgets/text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  static const id = 'edit_profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var loggedInUser;
  var loggedInUserName;
  var loggedInUserEmail;
  var loggedInUserFloor;

  _runInitializations() {
    getCurrentUser();
    getData();
  }

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

  getData() async {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Hero(
                    tag: 'profile_img',
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://media.istockphoto.com/vectors/cute-panda-paws-up-over-wall-panda-face-cartoon-icon-vector-vector-id1162669873?k=20&m=1162669873&s=612x612&w=0&h=Vug2BRV7LEdrUNLp1rwSlpUNa0Vv7qh-l4hI1eDk2vw='),
                      radius: 70,
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomTextField(
                    text: loggedInUserName,
                    label: 'Full Name',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    text: loggedInUserEmail,
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    text: loggedInUserFloor,
                    label: 'Floor Number',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 50),
                  RoundedButton(
                    text: 'Update Profile',
                    onPressed: (){},
                    colour: const Color(0xFF50C2C9),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}