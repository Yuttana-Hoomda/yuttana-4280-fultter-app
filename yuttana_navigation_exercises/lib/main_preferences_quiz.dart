/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-3-15
/// this lab will show the quiz 3 question
/// and when click the choice the choice will change bgColor
/// and can click next or previous button for change the answer
/// and ca click home for navigate to cover screen
/// and can config the theme and profile in setting screen
/// -------- logic -------
/// add the setting icon to appBar for navigate to setting screen
/// create preference provider for manage state that config in setting screen
/// -----------------------
/// not using Ai
library;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuttana_navigation_exercises/screens/profile_screen.dart';
import 'package:yuttana_navigation_exercises/screens/quiz_result_screen.dart';
import 'package:yuttana_navigation_exercises/screens/quiz_screen_preference.dart';
import 'package:yuttana_navigation_exercises/screens/settings_screen.dart';
import 'package:yuttana_navigation_exercises/states/quiz_preferences_state.dart';

import 'main_navigation_quiz.dart';
import 'main_navigation_quiz_cover.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizPreferencesState(),
      child: const MainPreferencesQuiz(),
    ),
  );
}

class MainPreferencesQuiz extends StatefulWidget {
  const MainPreferencesQuiz({super.key});

  @override
  State<MainPreferencesQuiz> createState() => _MainPreferencesQuizState();
}

class _MainPreferencesQuizState extends State<MainPreferencesQuiz> {
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
      if (_selectedAnswers[i] ==
          quizData[i].choices.indexWhere((c) => c.isCorrect)) {
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
    final prefs = context.watch<QuizPreferencesState>();

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
      themeMode: prefs.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizCoverScreen(),
        '/quiz': (context) => QuizScreenPreference(
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
          score: score,
        ),
        '/setting': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen()
      },
    );
  }
}
