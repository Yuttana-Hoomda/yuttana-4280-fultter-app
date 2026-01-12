/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-1-6
/// this lab will show the quiz screen that have question, image and 4 choice
/// -------- logic -------
/// 1. i separate screen in 2 section that both is expanded
/// 2. top section is question component
///     in this component have properties is question and image
/// 3. bottom section is choice component that have properties as choice list
///     in this component have layout is 2 Row inside 1 column
///     that justify space between
/// -----------------------
/// Not Using Ai
library;

import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/components/question_with_choice.dart';

void main() => runApp(const MainQuizQuestion());

class MainQuizQuestion extends StatelessWidget {
  const MainQuizQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("663040428-0"), centerTitle: true),
        body: QuestionWithChoice(),
      ),
    );
  }
}
