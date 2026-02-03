/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-12-28
/// this lab will focus on create custom widget and separate file for clean project
/// the output it will grid area 2x2 that have 4 pet card widget
/// -------- logic -------
/// pet card widget --> i read slide professor
///     that have custom widget with properties required
///     in this widget it require image and pet name
/// pets Screen --> add 2 row that have children is 2 pet card inside the column
///     then make mainAxis is spaceEvenly
/// Not Using Ai
library;
import 'package:flutter/material.dart';
import 'package:yuttana_widgets_exercises/screens/pets_screen.dart';

void main() {
  runApp(const PetGallery());
}

class PetGallery extends StatelessWidget {
  const PetGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      home: const PetsScreen(),
    );
  }
}