/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-2-10
/// this lab will show the quiz with 4 choice from previous lab
/// and when click the correct answer --> bgColor change to green
///           ''        wrong answer  --> bgColor change to red
/// and it wil show the dialog box if correct 1 score, wrong 0 score
/// -------- logic -------
/// 1. Reuse question widget from previous lab (quiz screen lab)
/// 2. create question choice widget(stateful widget)t by using GestureDetect
///     for allow choice can tap, write logic change bgColor in setState
///     so flutter will rebuild with new bgColor
/// -----------------------
/// Not Using Ai
library;

import 'package:flutter/material.dart';
import 'package:yuttana_interactivity_exercises/screens/question_with_choices.dart';

void main() => runApp(const MainQuizCheckAnswer());

class MainQuizCheckAnswer extends StatelessWidget {
  const MainQuizCheckAnswer({super.key});

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
      home: QuestionWithChoices(),
    );
  }
}
