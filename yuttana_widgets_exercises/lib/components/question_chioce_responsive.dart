import 'package:flutter/material.dart';
import 'package:yuttana_widgets_exercises/components/question_choice.dart';
import '../utils/responsive.dart';
import 'choice_card.dart';

class QuestionChoiceResponsive extends StatelessWidget {
  const QuestionChoiceResponsive({super.key, required this.choiceList});

  final List<ChoiceCard> choiceList;

  @override
  Widget build(BuildContext context) {
    return Responsive.isPortrait(context)
        ? QuestionChoice(choiceList: choiceList)
        : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 8
        ),
        itemCount: choiceList.length,
        itemBuilder: (context, index) {
          return ChoiceCard(name: choiceList[index].name, bgColor: choiceList[index].bgColor);
        }
    );
  }
}
