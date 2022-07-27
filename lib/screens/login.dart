import 'package:flutter/material.dart';
import 'package:h2know_flutter/screens/splash_screen.dart';
import 'package:h2know_flutter/widgets/form_field.dart';
import 'package:h2know_flutter/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const id = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset('assets/images/login-image.png'),
                CustomFormField(
                  placeholder: 'Plaksha Email ID',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                CustomFormField(
                  placeholder: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });

                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      Navigator.pushNamed(context, SplashScreen.id);

                      setState(() {
                        showSpinner = false;
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        setState(() {
                          showSpinner = false;
                        });
                        var snackBar = const SnackBar(
                            content:
                                Text("No user found for this email address"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (e.code == 'wrong-password') {
                        setState(() {
                          showSpinner = false;
                        });
                        var snackBar = const SnackBar(
                            content: Text("Password is incorrect"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100.0,
                        vertical: 15.0,
                      ),
                      backgroundColor: const Color(0xFF50C2C9),
                      shape: const StadiumBorder()),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Register.id);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Color(0xFF50C2C9)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}