import 'package:flutter/material.dart';
import '../components/movie_card.dart';
import '../models/movie_model.dart';

void _handleMovieTap(BuildContext context, double rating) {
  String msg = '';
  if (rating > 8.0) {
    msg = 'This is a highly rated movie!';
  } else if (rating >= 6.0 && rating <= 8.0) {
    msg = 'This is a good movie';
  } else {
    msg = 'This movie might need improvement';
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  final List<MovieModel> movies = const [
    MovieModel(
      title: "The Shawshank Redemption",
      year: 1994,
      genre: "Drama",
      director: "Frank Darabont",
      rating: 9.3,
    ),
    MovieModel(
      title: "Inception",
      year: 2010,
      genre: "Sci-Fi",
      director: "Christopher Nolan",
      rating: 7.8,
    ),
    MovieModel(
      title: "Disaster Movie",
      year: 2008,
      genre: "Comedy",
      director: "Jason Friedberg",
      rating: 1.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie List")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: movies.map((movie) {
          return MovieCard(
            movie: movie,
            onTap: () => _handleMovieTap(context, movie.rating),
          );
        }).toList(),
      ),
    );
  }
}
