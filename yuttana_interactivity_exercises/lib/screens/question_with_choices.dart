import 'package:flutter/material.dart';
import 'package:yuttana_interactivity_exercises/components/question_choice.dart';
import 'package:yuttana_interactivity_exercises/models/question_model.dart';
import 'package:yuttana_widgets_exercises/components/question_section.dart';
import 'package:yuttana_widgets_exercises/utils/responsive.dart';

final List<QuestionChoice> QuizChoices = [
  QuestionChoice(name: "Khon Kaen University", bgColor: Colors.purpleAccent, isCorrect: true,),
  QuestionChoice(name: "Chaing Mai University", bgColor: Colors.orangeAccent, isCorrect: false),
  QuestionChoice(name: "Chulalongkorn University", bgColor: Colors.pinkAccent, isCorrect: false),
  QuestionChoice(name: "Mahidol University", bgColor: Colors.blueAccent, isCorrect: false),
];

class QuestionWithChoices extends StatelessWidget {
  const QuestionWithChoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App by 663040428-0'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: QuestionSection(
                question: 'Where is this picture?',
                img: 'assets/kku.jpg',
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: Responsive.isPortrait(context) ? 2.4 : 7.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
                itemCount: QuizChoices.length,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) {
                  final choice = QuizChoices[index];
                  return QuestionChoice(
                    name: choice.name,
                    bgColor: choice.bgColor,
                    isCorrect: choice.isCorrect,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
