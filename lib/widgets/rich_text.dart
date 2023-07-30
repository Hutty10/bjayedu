import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.onTap,
    required this.baseText,
    required this.subText,
  });
  final GestureTapCallback onTap;
  final String baseText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: baseText,
        style: const TextStyle(
          color: Color(0xffA9A9A9),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: subText,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: const TextStyle(
              color: Color(0xffE60CFF),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
