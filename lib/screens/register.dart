import 'package:flutter/material.dart';
import '../widgets/register_form_field.dart';

class Register extends StatelessWidget {
  const Register ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              const RegisterFormField(placeholder: 'Full Name'),
              const RegisterFormField(placeholder: 'Floor Number'),
              const RegisterFormField(placeholder: 'Plaksha Email ID'),
              const RegisterFormField(placeholder: 'Password'),
              const RegisterFormField(placeholder: 'Confirm Password'),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {},
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
                  children: const [
                    Text(
                      'Already have an account? '
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(color: Color(0xFF50C2C9)),
                    )
                  ],
                )
              ],
          ),
        ),
      ),
    );
  }
}
