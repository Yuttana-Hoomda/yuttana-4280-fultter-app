import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rate,
    required this.defaultColor,
    required this.ratingColor
  });

  final int rate;
  final Color defaultColor;
  final Color ratingColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for(int i = 0; i < 5; i++)
          Icon(
              Icons.star,
            color: i < rate ? ratingColor : defaultColor,
          )
      ],
    );
  }
}
