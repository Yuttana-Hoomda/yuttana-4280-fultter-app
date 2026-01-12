import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor,
  });

  final String name;
  final Color bgColor;
  final Color? fgColor;

  Color textColor() {
    return fgColor ?? (ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
        ? Colors.white
        : Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Text(
        name,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: textColor(),
            fontSize: 16,
          fontWeight: FontWeight.w400
        ),
      )
    );
  }
}
