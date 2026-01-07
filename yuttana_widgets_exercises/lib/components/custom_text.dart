import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.fontSized,
    required this.fontWeight,
    required this.text,
    required this.color
  });

  final double fontSized;
  final FontWeight fontWeight;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSized,
        fontWeight: fontWeight,
        color: color
      ),
    );
  }
}
