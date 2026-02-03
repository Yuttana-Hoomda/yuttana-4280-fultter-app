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
