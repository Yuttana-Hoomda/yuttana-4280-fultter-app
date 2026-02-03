/// @author Yuttana Hoomda
/// @version 1.0
/// @date 2025-1-6
/// this lab will focus on using Color Scheme for make application good style color
/// the output will show list of movies that have title, year, genre, director and rating
/// with deep orange theme
/// -------- logic -------
/// 1. i separate file that have movie_screen, movie_card, movie_model and main_movie
/// 2. in movie_card it required movies list that provide in lab document
///     and required onTap function for show snack bar
/// 3. map movies list in movies_screen and use movie_card for display list of movies
///     create onTap function i have parameter is rating star for show different message
///     in snack bar that depend on rating star
/// 4. use movie_screen in main_movie
/// -----------------------
/// Using Ai for check error in Build context of snackBar it doesn't working
/// then find out because in movie_card onTap properties it wrong
library;

import 'package:flutter/material.dart';
import 'package:yuttana_widgets_exercises/screens/movie_screen.dart';

void main() => runApp(MainMovies());

class MainMovies extends StatelessWidget {
  const MainMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark
        )
      ),
      themeMode: ThemeMode.system,
      home: MovieScreen()
    );
  }
}
