import 'package:flutter/material.dart';

class QuestionChoiceCard extends StatelessWidget {
  const QuestionChoiceCard({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor,
    required this.isSelected,
    required this.onSelect
  });

  final String name;
  final Color bgColor;
  final Color? fgColor;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    Color textColor () {
      final currentBg = isSelected ? Theme.of(context).colorScheme.primaryContainer : bgColor;
      return fgColor ?? (ThemeData.estimateBrightnessForColor(currentBg) == Brightness.light
          ? Colors.black
          : Colors.white
      );
    }

    return GestureDetector(
      onTap: () => onSelect(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: isSelected ? Theme.of(context).colorScheme.primaryContainer : bgColor,
        child: Text(
          name,
          style: TextStyle(
            color: textColor(),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
