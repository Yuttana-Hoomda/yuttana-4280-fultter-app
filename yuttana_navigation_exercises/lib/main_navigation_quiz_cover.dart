/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-3-6
/// this lab will show the quiz 3 question
/// and when click the choice the choice will change bgColor
/// and can click next or previous button for change the answer
/// and ca click home for navigate to cover screen
/// then it show that total score after click submit button
/// -------- logic -------
/// 1) modify the code from problem1 in quiz_screen_home
///   by wrap the navigate button inside Visibility widget for make layout stable
///   even some button is invisible
/// 2) create list of routes and navigate by name that make can manage state easier
/// -----------------------
/// not using Ai
library;

import 'package:flutter/material.dart';
import 'package:yuttana_navigation_exercises/screens/quiz_screen_home.dart';

import 'main_navigation_quiz.dart';

void main() => runApp(MainNavigationQuizCover());

class MainNavigationQuizCover extends StatefulWidget {
  const MainNavigationQuizCover({super.key});

  @override
  State<MainNavigationQuizCover> createState() => _MainNavigationQuizCoverState();
}

class _MainNavigationQuizCoverState extends State<MainNavigationQuizCover> {
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
                _resetState();
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
      },
    );
  }
}

class QuizCoverScreen extends StatelessWidget {
  const QuizCoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.quiz_outlined,
                    size: 120,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Welcome to the Quiz App YH',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'By Yuttana Hoomda 663040428-0',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 180,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/quiz');
                      },
                      child: Text(
                        'Start',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: colorScheme.primary
                        ),
                      )
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
