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
    required this.onPrevious,
    required this.showNextButton,
    required this.showPreviousButton,
    required this.initialSelectedIndex,
    required this.isInitiallyAnswered,
  });

  final Question question;
  final Function(int choiceIndex) onAnswer;
  final ValueChanged<BuildContext> onNext;
  final VoidCallback onPrevious;
  final bool showNextButton;
  final bool showPreviousButton;
  final int initialSelectedIndex;
  final bool isInitiallyAnswered;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;

  @override
  @override
  void initState() {
    setState(() {
      selectedIndex = widget.initialSelectedIndex;
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant QuizScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.isInitiallyAnswered != widget.isInitiallyAnswered) {
      setState(() {
        selectedIndex = widget.initialSelectedIndex;
        debugPrint('from didupdatewidget: $selectedIndex');
      });
    }
  }

  void _handleChoiceSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onAnswer(index);
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
                    isSelected: selectedIndex != null && selectedIndex == index,
                    onSelect: () => _handleChoiceSelected(index),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: widget.showPreviousButton
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end,
                children: [
                  if (widget.showPreviousButton)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () => widget.onPrevious(),
                      child: const Text('Previous'),
                    ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                      backgroundColor: widget.showNextButton
                          ? null
                          : Theme.of(context).colorScheme.primaryContainer,
                    ),
                    onPressed: () => widget.onNext(context),
                    /// always show next button unitil last question
                    child: Text(widget.showNextButton ? 'Next' : 'Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
