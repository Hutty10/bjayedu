import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = 140,
  });
  final VoidCallback? onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffE60CFF),
        foregroundColor: Colors.white,
        disabledBackgroundColor: const Color(0xffE60CFF).withOpacity(.5),
        fixedSize: Size(width, 47),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Text(text),
    );
  }
}
