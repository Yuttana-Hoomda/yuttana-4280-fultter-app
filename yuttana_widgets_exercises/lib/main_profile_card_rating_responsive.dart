/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-1-16
/// this lab will show Responsive of profile, contact information and rating star
/// -------- logic -------
/// 1. i use Safe area in main_profile_card_rating_responsive
/// 2. in widget profile_card_rating_responsive that use in main file
///     use Orientation builder and use if orientation is equal portrait
///     display profile card from previous lab
///     else display component as row with 2 column that contain
///     profile card and (contact information, rating)
/// -----------------------
/// Not Using Ai
library;

import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/screens/profile_card_rating_responsive.dart';

void main() => runApp(const MainProfileCardRatingResponsive());

class MainProfileCardRatingResponsive extends StatelessWidget {
  const MainProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: OrientationBuilder(
            builder: (BuildContext context, orientation) {
              return SafeArea(child: ProfileCardRatingResponsive());
            }
        ),
      )
    );
  }
}
