/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-3-5
/// this lab will show the quiz 3 question
/// and when click the choice the choice will change bgColor
/// and can click next or previous button for change the answer
/// then it show that total score after click submit button
/// -------- logic -------
///   the logic for check score use loop in selectedIndex
///   to check it equal the index of correct choice from quizData
///   score is plus 1
///   --- but it still runtime O(n^2) because it loop twice
///       1) loop for check it is selectedChoice correct
///       2) loop for find where the index of correct choice of the question
/// -----------------------
/// Using Claude Ai for solving: bgColor of choice have to click twice for change color
/// solution: use properties that pass from parent widget directly because at first i use in local state;
/// in first build it receive that value change from parent, second build check condition for change color
/// --- so use properties directly it rebuild screen with parent widget that make it always get lasted value
library;

import 'package:flutter/material.dart';
import 'package:yuttana_interactivity_exercises/models/choice_model.dart';
import 'package:yuttana_interactivity_exercises/models/question_model.dart';
import 'package:yuttana_navigation_exercises/screens/quiz_screen.dart';

void main() => runApp(MainNavigationQuiz());

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
  Question(
    title: "Which planet is famous for its prominent ring system?",
    imagePath: "assets/saturn.jpg",
    choices: [
      Choice(name: "Mercury", isCorrect: false, displayColor: Colors.grey),
      Choice(name: "Saturn", isCorrect: true, displayColor: Colors.orange),
      Choice(name: "Earth", isCorrect: false, displayColor: Colors.blueAccent),
      Choice(
        name: "Venus",
        isCorrect: false,
        displayColor: Colors.orangeAccent,
      ),
    ],
  ),
];

class MainNavigationQuiz extends StatefulWidget {
  const MainNavigationQuiz({super.key});

  @override
  State<MainNavigationQuiz> createState() => _MainNavigationQuizState();
}

class _MainNavigationQuizState extends State<MainNavigationQuiz> {
  int currentQuestionIndex = 0;
  int score = 0;
  int _resetCounter = 0;
  late bool showNextButton = true;
  late bool showPreviousButton = false;
  final Map<int, int?> _selectedAnswers = {};
  final Map<int, bool> _questionAnswered = {};

  void _handleNext(BuildContext context) {
    if(currentQuestionIndex < quizData.length - 1) {
      setState(() {
        currentQuestionIndex++;
        showNextButton = currentQuestionIndex < quizData.length - 1;
        showPreviousButton = currentQuestionIndex > 0;
      });
    } else {
      _totalScore();
      _showResultDialog(context);
    }
  }

  void _handleAnswer(int selectedIndex) {
    setState(() {
      _selectedAnswers[currentQuestionIndex] = selectedIndex;
      debugPrint('$_selectedAnswers');
      _questionAnswered[currentQuestionIndex] = true;
    });
  }

  void _handlePrevious() {
    if(currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        showNextButton = currentQuestionIndex < quizData.length - 1;
        showPreviousButton = currentQuestionIndex > 0;
      });
    }
  }

  void _totalScore() {
    for (int i = 0; i < quizData.length; i++) {
      if(_selectedAnswers[i] == quizData[i].choices.indexWhere((c) => c.isCorrect)) {
        score++;
      }
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
                  showPreviousButton = false;
                  showNextButton = true;
                  _selectedAnswers.clear();
                  _questionAnswered.clear();
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
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: QuizScreen(
        key: ValueKey('${currentQuestionIndex}_$_resetCounter'),
        question: quizData[currentQuestionIndex],
        onAnswer: _handleAnswer,
        onNext: _handleNext,
        onPrevious: _handlePrevious,
        showNextButton: showNextButton,
        showPreviousButton: showPreviousButton,
        initialSelectedIndex: _selectedAnswers[currentQuestionIndex] ?? -1,
        isInitiallyAnswered: _questionAnswered[currentQuestionIndex] ?? false,
      ),
    );
  }
}
