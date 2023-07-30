import 'package:flutter/material.dart';

class SignInUpButton extends StatelessWidget {
  const SignInUpButton({
    super.key,
    required this.onPressed,
    this.isSignIn = true,
    required this.text,
  });
  final bool isSignIn;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor:
            isSignIn ? const Color(0xffE60CFF) : const Color(0xff6A6A6A),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        fixedSize: const Size(160, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: isSignIn ? const Radius.circular(20) : Radius.zero,
            topRight: isSignIn ? Radius.zero : const Radius.circular(20),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
