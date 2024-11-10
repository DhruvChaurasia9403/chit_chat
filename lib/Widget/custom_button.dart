
import 'package:chatting/Utility/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key , required this.text , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: buttonColor),
          ),
          backgroundColor: buttonColor,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(text, style: const TextStyle(fontSize: 17),),

      ),
    );
  }
}