import '../components/choice_card.dart';

class QuizModel {
  final String question;
  final String img;
  final List<ChoiceCard> choice;

  const QuizModel({
    required this.question,
    required this.img,
    required this.choice,
  });
}
