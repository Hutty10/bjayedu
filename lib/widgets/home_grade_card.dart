import 'package:flutter/material.dart';

class HomeGradCard extends StatelessWidget {
  const HomeGradCard({
    super.key,
    required this.color,
    required this.grade,
    required this.image,
  });
  final String image;
  final String grade;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional.bottomStart,
        child: Text(
          '$grade\nGrade',
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
