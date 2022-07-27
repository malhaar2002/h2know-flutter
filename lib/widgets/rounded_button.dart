import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.hpadding = 60.0,
      this.vpadding = 10.0,
      required this.colour});
  final String text;
  final VoidCallback onPressed;
  final double hpadding;
  final double vpadding;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: hpadding,
            vertical: vpadding,
          ),
          backgroundColor: colour,
          shape: const StadiumBorder()),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
