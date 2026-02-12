import 'package:flutter/material.dart';

class QuestionSection extends StatelessWidget {
  const QuestionSection({super.key, required this.question, required this.img});

  final String question;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
              ),
            ),
          ),
          Expanded(child: Image.asset(
              img, height: 200, width: 320, fit: BoxFit.contain)),
        ],
      ),
    );
  }
}
