import 'package:flutter/material.dart';

class QuestionSection extends StatelessWidget {
  const QuestionSection({super.key, required this.question, required this.img});

  final String question;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Image.asset(img, height: 200, width: 320, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
