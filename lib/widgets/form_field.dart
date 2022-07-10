import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key, this.label = '', this.placeholder = '', required this.onChanged, required this.keyboardType, this.obscureText = false});
  final String label;
  final String placeholder;
  final void Function(String) onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  // TODO: Implement Label instead of Placeholder and figure out a way to center it when the textfield is not focused
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          // alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          // label: Text(label),
          hintText: placeholder,
        ),
        style: const TextStyle(fontSize: 15),
        onChanged: onChanged,
      ),
    );
  }
}