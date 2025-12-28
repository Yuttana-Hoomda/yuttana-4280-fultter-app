import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String label;
  final String? fontFamily;
  final double fontSize;
  final FontWeight fontWeight ;
  final Color bgColor;
  final Color textColor;

  const CustomFont({
    required this.label,
    this.fontFamily,
    this.fontSize = 24.0,
    this.fontWeight = FontWeight.normal,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: textColor
        ),
      ),
    );
  }
}
