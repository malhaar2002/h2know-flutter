import 'package:flutter/material.dart';

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({super.key, required this.placeholder});
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          hintText: placeholder,
        ),
      ),
    );
  }
}