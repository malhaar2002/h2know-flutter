import 'package:flutter/material.dart';
import 'register.dart';

class Welcome extends StatelessWidget {
  const Welcome ({super.key});
  static const id = "welcome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset('assets/images/top-left.png')
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/logo.png'),
                width: 205,
                height: 205,
              ),
              const Text(
                'Welcome to H2knOw',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              const Text(
                'Paani Mat Waste Kar Na Bhai',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Register.id);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60.0,
                    vertical: 10.0
                  ),
                  primary: Colors.black,
                  backgroundColor: Colors.cyan[100],
                  shape: const StadiumBorder()
                ),
                child: const Text(
                  'Jump Onboard',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),    
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/images/bottom-right.png')
          ),
       ],
      ),
    );
  }
}