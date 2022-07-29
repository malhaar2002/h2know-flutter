import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:h2know_flutter/dialogs/policy_dialog.dart';
import 'package:h2know_flutter/screens/splash_screen.dart';
import 'package:h2know_flutter/widgets/form_field.dart';
import 'package:h2know_flutter/screens/login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:h2know_flutter/constants/title_case.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const id = 'register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool showSpinner = false;
  late String email;
  late String fullName;
  late var floorNo = 0;
  late String password;
  late String repeatPassword;
  bool termsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome Onboard!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Let's help you set up your profile",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomFormField(
                    placeholder: 'Full Name',
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      fullName = value;
                      fullName = fullName.toTitleCase();
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    placeholder: 'Floor Number',
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      floorNo = int.parse(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    placeholder: 'Plaksha Email ID',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                      email = email.toLowerCase();
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    placeholder: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    placeholder: 'Confirm Password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (value) {
                      repeatPassword = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: termsAndConditions,
                        onChanged: ((value) {
                          setState(() {
                            termsAndConditions = !termsAndConditions;
                          });
                        }),
                      ),
                      const Text('I have read and agree to the '),
                      GestureDetector(
                        onTap: (() {
                          showDialog(context: context, builder: ((context) => const PolicyDialog(mdFileName: 'terms_and_conditions.md')));
                        }),
                        child: const Text(
                          'Terms and Conditions',
                          style: TextStyle(
                            color: Color(0xFF50C2C9),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('and '),
                      GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: ((context) => const PolicyDialog(mdFileName: 'privacy_policy.md')));
                        },
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF50C2C9),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });

                      try {
                        if (termsAndConditions) {
                          if (password == repeatPassword) {
                            // Create user account with firebase_auth
                            final UserCredential userCredential =
                                await _auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );

                            // Add to firestore database under collection 'users'
                            var collection = _firestore.collection('users');
                            collection.doc(email).set({
                              'email': email,
                              'floor_no': floorNo,
                              'full_name': fullName,
                              'level': 1
                            }).then((value) {
                              Navigator.pushNamed(context, SplashScreen.id);
                              setState(() {
                                showSpinner = false;
                              });
                            });
                          } else {
                            setState(() {
                              showSpinner = false;
                            });
                            var snackBar = const SnackBar(
                                content: Text(
                                    "Password and Repeat Password do not match"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          setState(() {
                            showSpinner = false;
                          });
                          var snackBar = const SnackBar(
                              content: Text(
                                  "Please Agree to the Terms and Conditions to Proceed"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          setState(() {
                            showSpinner = false;
                          });
                          var snackBar = const SnackBar(
                              content:
                                  Text("The password provided is too weak"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (e.code == 'email-already-in-use') {
                          setState(() {
                            showSpinner = false;
                          });
                          var snackBar = const SnackBar(
                              content: Text("Account already exists"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } catch (e) {
                        if (kDebugMode) {
                          print(e);
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15.0),
                        backgroundColor: const Color(0xFF50C2C9),
                        shape: const StadiumBorder()),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(color: Color(0xFF50C2C9)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
