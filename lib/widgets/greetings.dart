import 'package:flutter/material.dart';

class Greatings extends StatelessWidget {
  const Greatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Hi, ',
          style: TextStyle(
            color: Color(0xffE60CFF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Quamdeen',
          style: TextStyle(
            // color: Color(0xffE60CFF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
