import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:h2know_flutter/screens/dashboard.dart';
import 'package:h2know_flutter/widgets/register_form_field.dart';
import 'package:h2know_flutter/screens/login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends StatefulWidget {
  const Register ({super.key});
  static const id = 'register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
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
                const SizedBox(height: 40),
                RegisterFormField(
                  placeholder: 'Full Name',
                  keyboardType: TextInputType.name,
                  onChanged: (value) {},
                ),
                RegisterFormField(
                  placeholder: 'Floor Number',
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                ),
                RegisterFormField(
                  placeholder: 'Plaksha Email ID',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                RegisterFormField(
                  placeholder: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                RegisterFormField(
                  placeholder: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () async {
          
                      setState(() {
                        showSpinner = true;
                      });
          
                      try {
                        final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        Navigator.pushNamed(context, Dashboard.id);
          
                        setState(() {
                          showSpinner = false;
                        });
          
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100.0,
                        vertical: 15.0
                      ),
                      primary: Colors.white,
                      backgroundColor: const Color(0xFF50C2C9),
                      shape: const StadiumBorder()
                    ),
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
                      const Text(
                        'Already have an account? '
                      ),
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
    );
  }
}
