import 'package:flutter/material.dart';

class QuestionChoice extends StatefulWidget {
  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor,
    required this.isCorrect,
  });

  final String name;
  final Color bgColor;
  final Color? fgColor;
  final bool isCorrect;

  @override
  State<QuestionChoice> createState() => _QuestionChoiceState();
}

class _QuestionChoiceState extends State<QuestionChoice> {
  late Color currentColor = widget.bgColor;

  void popup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.isCorrect ? 'Correct!' : 'Incorrect'),
          content: Text(
            'Your score is ${widget.isCorrect ? 1 : 0}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void changeBgColor() {
    if(widget.isCorrect){
      currentColor = Colors.green;
    } else {
      currentColor = Colors.red;
    }
  }

  void onTap() {
    popup();
    setState(() {
      changeBgColor();
    });
  }

  Color textColor() {
    return widget.fgColor ?? (ThemeData.estimateBrightnessForColor(currentColor) == Brightness.dark
        ? Colors.white
        : Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: currentColor,
        child: Text(
          widget.name,
          style: TextStyle(
            color: textColor(),
            fontSize: 18,
          ),
      ),
      ),
    );
  }
}
