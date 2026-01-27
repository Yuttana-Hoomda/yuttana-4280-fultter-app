import 'package:flutter/material.dart';

IconData _starIcon(int i, double rating) {
  if(i < rating.floor()) {
    return Icons.star;
  }else if(rating - i == 0.5) {
    return Icons.star_half;
  } else {
    return Icons.star_outline;
  }
}

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.rating});

  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int i = 0; i < 5; i++)
          Icon(
            size: 18,
            _starIcon(i, rating),
            color: i < rating.floor() || rating - i == 0.5 ? Colors.yellow : Colors.grey,
          )
      ],
    );
  }
}
