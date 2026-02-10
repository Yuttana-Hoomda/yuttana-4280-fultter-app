import 'package:flutter/material.dart';

class QuestionChoiceCard extends StatefulWidget {
  const QuestionChoiceCard({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor,
    required this.isCorrect,
    required this.onSelect
  });

  final String name;
  final Color bgColor;
  final Color? fgColor;
  final bool isCorrect;
  final VoidCallback onSelect;

  Color textColor () {
    return fgColor ?? (ThemeData.estimateBrightnessForColor(bgColor) == Brightness.light
      ? Colors.black
      : Colors.white
    );
  }

  @override
  State<QuestionChoiceCard> createState() => _QuestionChoiceCardState();
}

class _QuestionChoiceCardState extends State<QuestionChoiceCard> {
  late Color currentBgColor = widget.bgColor;

  void _onTap() {
    setState(() {
      if(widget.isCorrect) {
        currentBgColor = Colors.green;
      } else {
        currentBgColor = Colors.red;
      }
    });
    widget.onSelect();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: currentBgColor,
        child: Text(
          widget.name,
          style: TextStyle(
            color: widget.textColor(),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
