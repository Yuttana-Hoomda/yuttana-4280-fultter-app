import 'package:flutter/material.dart';
import 'package:yuttana_4280_fultter_app/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, required this.onTap});
  final MovieModel movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    starColor(double rate) {
      if (rate >= 5) {
        return Theme.of(context).colorScheme.primary;
      }
    }

    return ListTile(
      title: Text(
        movie.title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
      leading: Icon(Icons.movie, color: Theme.of(context).colorScheme.primary),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${movie.year.toString()} • ${movie.genre}',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          Text(
            'Director: ${movie.director}',
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.star, color: starColor(movie.rating)),
          SizedBox(width: 5),
          Text(
            movie.rating.toString(),
            style: TextStyle(
                color: starColor(movie.rating),
                fontSize: 14
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
