import 'package:flutter/material.dart';
import 'package:yuttana_interactivity_exercises/models/question_model.dart';

class QuizResultScreen extends StatelessWidget {
  final Map<int, int?> selectedAnswers;
  final List<Question> questions;
  final int score;
  final VoidCallback onRestart;

  const QuizResultScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.score,
    required this.onRestart
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    'Your Score',
                    style: textTheme.headlineMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    '$score/${questions.length}',
                    style: textTheme.displayLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),

            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final indexOfAnswer = selectedAnswers[index];
                final answer = indexOfAnswer != null
                    ? question.choices[indexOfAnswer].name
                    : null;
                final indexOfCorrectAnswer = question.choices.indexWhere(
                  (c) => c.isCorrect,
                );
                final correctAnswer =
                    question.choices[indexOfCorrectAnswer].name;
                final isCorrect = indexOfAnswer == indexOfCorrectAnswer;
                final avatarBgColor = indexOfAnswer != null
                    ? question.choices[indexOfAnswer].displayColor
                    : colorScheme.primaryContainer;

                return _answerCard(
                  question.title,
                  answer,
                  correctAnswer,
                  isCorrect,
                  avatarBgColor,
                  index + 1,
                  context,
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                onRestart();
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Restart',
                style: textTheme.headlineMedium?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _answerCard(
    String question,
    String? answer,
    String correctAnswer,
    bool isCorrect,
    Color avatarBgColor,
    int numOfQuestion,
    BuildContext context,
  ) {
    final isAnswer = answer != null;
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    final titleMedium = Theme.of(context).textTheme.titleMedium;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: avatarBgColor,
          child: Text('$numOfQuestion'),
        ),
        title: Text(question, style: isAnswer ? titleLarge : titleMedium),
        subtitle: Text(
          isAnswer
              ? isCorrect
                    ? '$answer ✓'
                    : '$answer x Should be $correctAnswer'
              : 'Not answered - Correct: $correctAnswer',
          style: isAnswer
              ? titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isAnswer
                      ? isCorrect
                            ? Colors.green
                            : Colors.red
                      : Colors.orange,
                )
              : titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
        ),
      ),
    );
  }
}
