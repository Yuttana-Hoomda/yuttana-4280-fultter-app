/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-12-17
/// widget custom font with properties label, font, fontWeight, color, bgColor and fontSize
/// this lab will show my name that have bg blue color and text white color in center of screen
/// -------- logic -------
/// I Read the document about custom widget that professor provide in google classroom
/// then read the lab document to see which properties is required
/// Not Using Ai
library;
import 'package:flutter/material.dart';
import 'components/custom_font.dart';

void main() => runApp(MainCustomFont());

class MainCustomFont extends StatelessWidget {
  const MainCustomFont({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: const CustomFont(
              label: 'ยุทธนา หูมดา',
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
              bgColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
