import 'package:flutter/material.dart';
import 'package:h2know_flutter/widgets/register_form_field.dart';

import 'register.dart';

class Login extends StatelessWidget {
  const Login ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
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
              const RegisterFormField(placeholder: 'Plaksha Email ID'),
              const RegisterFormField(placeholder: 'Password'),
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
                  const Text(
                    "Don't have an account? "
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Register()));
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Color(0xFF50C2C9)),
                    ),
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