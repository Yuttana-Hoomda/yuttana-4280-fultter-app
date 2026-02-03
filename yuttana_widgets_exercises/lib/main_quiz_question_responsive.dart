/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-1-26
/// this lab will show the quiz screen that have question, image and 4 choice
/// can responsive both portrait and landscape
/// -------- logic -------
/// 1.Use media queries to get context is screen portrait or landscape
/// 2.if screen is portrait display choice that show as previous exam
/// 3.if screen is landscape make each choice full width by using GridView
///   and define aspect ratio 8 for making choice size as rectangle
/// -----------------------
/// using Chatgpt:
///   prompt: why the choice is overflow, i use 2 expanded inside the column
///           and attach image screen, and code of QuestionWithChoice widget
///   answer: you should check the image of question in fit properties should be BoxFit.contain not cover
///         and add properties flex to both expanded that you use to contain question section and choice
///         make question section have more space that choice section if screen is landscape
library;

import 'package:flutter/material.dart';
import 'package:yuttana_widgets_exercises/components/question_with_choice.dart';

void main() => runApp(MainQuizQuestionResponsive());

class MainQuizQuestionResponsive extends StatelessWidget {
  const MainQuizQuestionResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
            brightness: Brightness.light
        )
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
          brightness: Brightness.dark
        )
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: Text("663040428-0"), centerTitle: true),
        body: QuestionWithChoice()
      )
    );
  }
}
