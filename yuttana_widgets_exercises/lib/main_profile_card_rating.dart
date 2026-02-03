/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-1-14
/// this lab will show profile, contact information and rating star
/// -------- logic -------
/// 1. in profile_card_rating component have 3 widget
///   profile card, contact information and rating star
///   inside column with space between in main axis
/// 2. in profile card have picture and name as properties
///   in this widget use stack for make name top to picture
/// 3. contact_info have contact information as properties
///   in this widget use card to contain contact information
/// 4. rating have rating color, default color and rating as properties
///   use for loop inside row for display 5 star
///   and have condition in properties color of Icon
///   for make it display number of star that have rating color depend on rating
/// -----------------------
/// Not Using Ai
library;

import 'package:flutter/material.dart';
import 'package:yuttana_widgets_exercises/screens/profile_card_rating.dart';

void main() => runApp(const MainProfileCardRating());

class MainProfileCardRating extends StatelessWidget {
  const MainProfileCardRating({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepOrange,
              brightness: Brightness.light
          )
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
            brightness: Brightness.dark
        )
      ),
      themeMode: ThemeMode.system,
      home: ProfileCardRating(),
    );
  }
}
