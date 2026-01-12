import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/components/question_choice.dart';
import 'package:yuttana_4280_fultter_app/components/question_section.dart';
import 'package:yuttana_4280_fultter_app/models/quiz_model.dart';

import 'choice_card.dart';

final QuizModel quiz = QuizModel(
  question: "Where is this picture",
  img: "assets/kku.jpg",
  choice: [
    ChoiceCard(name: "Khon Kaen University", bgColor: Colors.purpleAccent),
    ChoiceCard(name: "Chaing Mai University", bgColor: Colors.orangeAccent),
    ChoiceCard(name: "Chulalongkorn University", bgColor: Colors.pinkAccent),
    ChoiceCard(name: "Mahidol University", bgColor: Colors.blueAccent),
  ],
);

class QuestionWithChoice extends StatelessWidget {
  const QuestionWithChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: QuestionSection(question: quiz.question, img: quiz.img),
          ),
          Expanded(child: QuestionChoice(choiceList: quiz.choice)),
        ],
      ),
    );
  }
}
