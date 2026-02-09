/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-2-4
/// this lab will show the the profile card, contact information
/// and rating star that tapable if tap second star rating will show 2 fill star
/// -------- logic -------
/// 1. Reuse all widget from previous lab except rating star
/// 2. create rating widget with ful state
///     - logic onTap is show fill star when click
///        initial star to 0 because it display by index
///        in set state set star to index(number of star - 1)
/// -----------------------
/// Not Using Ai
library;
import 'package:flutter/material.dart';
import 'package:yuttana_interactivity_exercises/screens/profile_card_rating_responsive.dart';

void main() => runApp(const MainInteractivityProfile());

class MainInteractivityProfile extends StatelessWidget {
  const MainInteractivityProfile({super.key});

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
      home: ProfileCardRatingResponsive(),
    );
  }
}
