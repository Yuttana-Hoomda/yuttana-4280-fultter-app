import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/components/choice_card.dart';

class QuestionChoice extends StatelessWidget {
  const QuestionChoice({super.key, required this.choiceList});

  final List<ChoiceCard> choiceList;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChoiceCard(name: choiceList[0].name, bgColor: choiceList[0].bgColor),
            ChoiceCard(name: choiceList[2].name, bgColor: choiceList[2].bgColor)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChoiceCard(name: choiceList[1].name, bgColor: choiceList[1].bgColor),
            ChoiceCard(name: choiceList[3].name, bgColor: choiceList[3].bgColor)
          ],
        )
      ],
    );
  }
}
