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
