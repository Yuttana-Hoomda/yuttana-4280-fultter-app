import 'package:flutter/material.dart';
import 'package:yuttana_interactivity_exercises/models/question_model.dart';
import 'package:yuttana_widgets_exercises/components/question_section.dart';
import 'package:yuttana_widgets_exercises/utils/responsive.dart';

import '../components/question_choice_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onNext,
  });

  final Question question;
  final ValueChanged<bool> onAnswer;
  final ValueChanged<BuildContext> onNext;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int? selectedIndex;
  bool selectionMade = false;

  void _handleChoiceSelected(int index) {
    bool isCorrect = widget.question.choices[index].isCorrect;

    setState(() {
      selectedIndex = index;
      selectionMade = true;
    });

    widget.onAnswer(isCorrect);
  }

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
                question: widget.question.title,
                img: widget.question.imagePath,
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: Responsive.isPortrait(context) ? 2.4 : 7.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget.question.choices.length,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemBuilder: (context, index) {
                  final choice = widget.question.choices[index];
                  return QuestionChoiceCard(
                    name: choice.name,
                    bgColor: choice.displayColor,
                    isCorrect: choice.isCorrect,
                    onSelect: () => _handleChoiceSelected(index),
                  );
                },
              ),
            ),
            if (selectionMade)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50)
                ),
                onPressed: () => widget.onNext(context),
                child: const Text('Next'),
              ),
          ],
        ),
      ),
    );
  }
}
