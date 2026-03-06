/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-3-6
/// this lab will show the quiz 3 question
/// and when click the choice the choice will change bgColor
/// and can click next or previous button for change the answer
/// and ca click home for navigate to cover screen
/// if click submit ----> show result score, and answer
/// -------- logic -------
/// 1) modify the code from problem2 in quiz_screen_home
///   by modify the submit logic with after calculate score push to result screen
/// 2) create result screen that receive parameter form main
///   the result screen will show your answer if correct it be green
///   if it not will show the correct answer of question
/// -----------------------
/// not using Ai
library;

import 'package:flutter/material.dart';
import 'package:yuttana_navigation_exercises/screens/quiz_result_screen.dart';
import 'package:yuttana_navigation_exercises/screens/quiz_screen_home.dart';

import 'main_navigation_quiz.dart';
import 'main_navigation_quiz_cover.dart';

void main() => runApp(MainNavigationQuizResult());

class MainNavigationQuizResult extends StatefulWidget {
  const MainNavigationQuizResult({super.key});

  @override
  State<MainNavigationQuizResult> createState() =>
      _MainNavigationQuizResultState();
}

class _MainNavigationQuizResultState extends State<MainNavigationQuizResult> {
  int currentQuestionIndex = 0;
  int score = 0;
  int _resetCounter = 0;
  late bool showNextButton = true;
  late bool showPreviousButton = false;
  final Map<int, int?> _selectedAnswers = {};
  final Map<int, bool> _questionAnswered = {};

  void _handleNext(BuildContext context) {
    if (currentQuestionIndex < quizData.length - 1) {
      setState(() {
        currentQuestionIndex++;
        showNextButton = currentQuestionIndex < quizData.length - 1;
        showPreviousButton = currentQuestionIndex > 0;
      });
    } else {
      _totalScore();
     Navigator.pushNamed(context, '/result');
    }
  }

  void _handleAnswer(int selectedIndex) {
    setState(() {
      _selectedAnswers[currentQuestionIndex] = selectedIndex;
      debugPrint('$_selectedAnswers');
      _questionAnswered[currentQuestionIndex] = true;
    });
  }

  void _totalScore() {
    for (int i = 0; i < quizData.length; i++) {
      if(_selectedAnswers[i] == quizData[i].choices.indexWhere((c) => c.isCorrect)) {
        setState(() {
          score++;
        });
      }
    }
  }

  void _handlePrevious() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        showNextButton = currentQuestionIndex < quizData.length - 1;
        showPreviousButton = currentQuestionIndex > 0;
      });
    }
  }

  void _resetState() {
    setState(() {
      score = 0;
      currentQuestionIndex = 0;
      _resetCounter++;
      showPreviousButton = false;
      showNextButton = true;
      _selectedAnswers.clear();
      _questionAnswered.clear();
    });
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
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizCoverScreen(),
        '/quiz': (context) => QuizScreenHome(
          key: ValueKey('${currentQuestionIndex}_$_resetCounter'),
          question: quizData[currentQuestionIndex],
          onAnswer: _handleAnswer,
          onNext: _handleNext,
          onReset: _resetState,
          onPrevious: _handlePrevious,
          showNextButton: showNextButton,
          showPreviousButton: showPreviousButton,
          initialSelectedIndex: _selectedAnswers[currentQuestionIndex] ?? -1,
          isInitiallyAnswered: _questionAnswered[currentQuestionIndex] ?? false,
        ),
        '/result': (context) => QuizResultScreen(
            questions: quizData,
            selectedAnswers: _selectedAnswers,
            onRestart: _resetState,
            score: score
        )
      },
    );
  }
}
