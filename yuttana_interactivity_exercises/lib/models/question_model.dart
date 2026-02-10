import 'choice_model.dart';

class Question {
  final String title;
  final String imagePath;
  final List<Choice> choices;

  const Question({
    required this.title,
    required this.imagePath,
    required this.choices,
  });
}

