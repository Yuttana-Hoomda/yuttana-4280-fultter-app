/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-2-2
/// this lab will show the the name, studentId , image and submit bottom at bottom
/// when click button it will show dialog that can select OK or Cancel
/// -------- logic -------
/// 1. Use Column as main widget layout with space evenly to make space is equal
/// 2. create helper method of Text widget because it display the same 3 times
/// 3. create show dialog function when place
/// -----------------------
/// Not Using Ai
library;
import 'package:flutter/material.dart';
import 'package:yuttana_widgets_exercises/components/profile_with_button.dart';

void main() => runApp(const MainProfileButton());

class MainProfileButton extends StatelessWidget {
  const MainProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
          brightness: Brightness.light
        )
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
          brightness: Brightness.dark
        )
      ),
      themeMode: ThemeMode.system,
      home: ProfileWithButton(),
    );
  }
}
