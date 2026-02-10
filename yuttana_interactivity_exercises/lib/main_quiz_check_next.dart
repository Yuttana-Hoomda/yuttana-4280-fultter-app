/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-2-10
/// this lab will show the quiz 2 question
/// and when click the correct answer --> bgColor change to green
///           ''        wrong answer  --> bgColor change to red
/// after click choice next button will display for navigate to next question
/// and it wil show the dialog box that show total score in the last question
/// -------- logic -------
/// 1. Reuse question widget from previous lab (quiz screen lab)
/// 2. create function that handle the flow of system to parent widget(main)
///     like check correct answer, navigate to next question, reset state when last question
/// 3. in child widget handle which choice that user click and it will pass all function from parent to children
/// 4. in children widget will handle bgColor change after tap and use function check answer that pass from paren
/// -----------------------
/// In this lab, i learned about Key value it will application not showing
/// the previous the state because the key make widget unique it work like primary key in DB
/// -----------------------
/// Not Using Ai
library;
import 'package:flutter/material.dart';
import 'package:yuttana_interactivity_exercises/screens/quiz_screen.dart';

import 'models/choice_model.dart';
import 'models/question_model.dart';

void main() => runApp(const MainQuizCheckNext());

final List<Question> quizData = [
  Question(
    title: "What is the largest planet in our solar system?",
    imagePath: "assets/jupiter.png",
    choices: [
      Choice(name: "Earth", isCorrect: false, displayColor: Colors.blueAccent),
      Choice(name: "Jupiter", isCorrect: true, displayColor: Colors.brown),
      Choice(name: "Uranus", isCorrect: false, displayColor: Colors.black),
      Choice(
        name: "Neptune",
        isCorrect: false,
        displayColor: Colors.yellowAccent,
      ),
    ],
  ),
  Question(
    title: "Which planet is known as the Red Planet?",
    imagePath: "assets/mars.png",
    choices: [
      Choice(name: "Earth", isCorrect: false, displayColor: Colors.blueAccent),
      Choice(
        name: "Venus",
        isCorrect: false,
        displayColor: Colors.orangeAccent,
      ),
      Choice(name: "Mars", isCorrect: true, displayColor: Colors.purpleAccent),
      Choice(name: "Jupiter", isCorrect: false, displayColor: Colors.brown),
    ],
  ),
];

class MainQuizCheckNext extends StatefulWidget {
  const MainQuizCheckNext({super.key});

  @override
  State<MainQuizCheckNext> createState() => _MainQuizCheckNextState();
}

class _MainQuizCheckNextState extends State<MainQuizCheckNext> {
  int currentQuestionIndex = 0;
  int score = 0;
  int _resetCounter = 0;
  bool questionAnswered = false;

  void _handleAnswer(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        score++;
        questionAnswered = true;
      });
    }
  }

  void _handleNext(BuildContext context) {
    if (currentQuestionIndex < quizData.length - 1) {
      setState(() {
        currentQuestionIndex++;
        questionAnswered = false;
      });
    } else {
      _showResultDialog(context);
    }
  }

  void _showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Complete!'),
          content: Text('Your score is $score/${quizData.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  score = 0;
                  currentQuestionIndex = 0;
                  _resetCounter++;
                });
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: QuizScreen(
        key: ValueKey('${currentQuestionIndex}_$_resetCounter'),
        question: quizData[currentQuestionIndex],
        onAnswer: _handleAnswer,
        onNext: _handleNext,
      ),
    );
  }
}
