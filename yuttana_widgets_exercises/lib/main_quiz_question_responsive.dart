import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/components/question_with_choice.dart';

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
